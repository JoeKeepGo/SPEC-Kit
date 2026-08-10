#!/bin/sh
# Optional Claude Code advisory hook for exact project-authority paths.
# Preflight and installation are project-owned. Set SAGE_PROTECTED_PATHS to a
# newline-separated list of exact relative or absolute paths. This hook observes
# structured file_path events only. It does not inspect shell text or resolve
# symlinks/aliases and is never a hard containment boundary.

warn() { printf 'Advisory: %s\n' "$1" >&2; }

[ -n "${SAGE_PROTECTED_PATHS:-}" ] || exit 0
input=$(cat)

extract_file_path() {
  if command -v jq >/dev/null 2>&1; then
    printf '%s' "$input" | jq -r '
      if (type == "object") and
         (.tool_input | type == "object") and
         (.tool_input.file_path | type == "string" and test("\\S"))
      then .tool_input.file_path
      else error("expected tool_input.file_path string")
      end
    ' 2>/dev/null
    return
  fi

  if command -v plutil >/dev/null 2>&1; then
    input_file=$(mktemp "${TMPDIR:-/tmp}/sagekit-hook.XXXXXX") || return 1
    trap 'rm -f "$input_file"' EXIT HUP INT TERM
    printf '%s' "$input" > "$input_file"
    plutil -lint "$input_file" >/dev/null 2>&1 || return 1
    plutil -extract tool_input.file_path xml1 -o - "$input_file" 2>/dev/null |
      grep -Eq '<string>[^<]*</string>' || return 1
    file=$(plutil -extract tool_input.file_path raw -o - "$input_file" 2>/dev/null) || return 1
    case "$file" in *[![:space:]]*) printf '%s\n' "$file" ;; *) return 1 ;; esac
    return
  fi

  return 1
}

if ! file=$(extract_file_path); then
  warn 'invalid structured file_path envelope; configured exact-path advisory blocks.'
  exit 2
fi

is_absolute() {
  case "$1" in
    /*|[A-Za-z]:/*|[A-Za-z]:\\*|\\\\*) return 0 ;;
    *) return 1 ;;
  esac
}

needs_project_root=false
is_absolute "$file" || needs_project_root=true
old_ifs=$IFS
IFS='
'
for configured in $SAGE_PROTECTED_PATHS; do
  [ -n "$configured" ] || continue
  if ! is_absolute "$configured"; then
    needs_project_root=true
    break
  fi
done
IFS=$old_ifs

base=${CLAUDE_PROJECT_DIR:-}
if [ "$needs_project_root" = true ] &&
   { [ -z "$base" ] || ! is_absolute "$base" || [ ! -d "$base" ]; }; then
  warn 'relative protected-path decisions require an existing absolute CLAUDE_PROJECT_DIR; configured exact-path advisory blocks.'
  exit 2
fi

canon() {
  printf '%s\n' "$1" | tr '\\' '/' | awk -v base="$base" '
    {
      p = $0; gsub(/\\/, "/", base)
      if (substr(p, 1, 1) != "/" && p !~ /^[A-Za-z]:\//) p = base "/" p
      n = split(p, seg, "/"); delete st; j = 0
      for (i = 1; i <= n; i++) {
        s = seg[i]; if (s == "" || s == ".") continue
        if (s == "..") { if (j > 0) j--; continue }
        st[++j] = s
      }
      out = (p ~ /^[A-Za-z]:\// ? st[1] : "")
      start = (p ~ /^[A-Za-z]:\// ? 2 : 1)
      for (i = start; i <= j; i++) out = out "/" st[i]
      print (out == "" ? "/" : out)
    }'
}

target=$(canon "$file")
old_ifs=$IFS
IFS='
'
for configured in $SAGE_PROTECTED_PATHS; do
  [ -n "$configured" ] || continue
  if [ "$target" = "$(canon "$configured")" ]; then
    warn "$file matches an exact project-authority protected path. Return an update proposal."
    exit 2
  fi
done
IFS=$old_ifs
exit 0
