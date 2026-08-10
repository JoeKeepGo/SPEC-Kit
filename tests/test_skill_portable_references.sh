#!/bin/sh
set -eu

repo_root=$(CDPATH= cd -- "$(dirname "$0")/.." && pwd -P)
skill_root=$repo_root/skills/sage-kit
manifest=$skill_root/skill-manifest.json
framework_root=$skill_root/references/framework

fail() {
  printf '%s\n' "$1" >&2
  exit 1
}

if command -v jq >/dev/null 2>&1; then
  json_value() { jq -er "$2 | strings" "$1"; }
elif command -v plutil >/dev/null 2>&1; then
  json_value() { plutil -extract "$3" raw -o - "$1"; }
else
  fail 'portable reference check requires jq or plutil'
fi

canonical_sha256() {
  if command -v sha256sum >/dev/null 2>&1; then
    sed 's/\r$//' "$1" | sha256sum | awk '{print $1}'
  else
    sed 's/\r$//' "$1" | shasum -a 256 | awk '{print $1}'
  fi
}

test -f "$manifest" || fail 'missing package identity manifest'
package_id=$(json_value "$manifest" '.package_id' 'package_id') || fail 'missing package id'
package_version=$(json_value "$manifest" '.package_version' 'package_version') || fail 'missing package version'
release_identity=$(json_value "$manifest" '.release_identity' 'release_identity') || fail 'missing release identity'
digest_algorithm=$(json_value "$manifest" '.locator.digest_algorithm' 'locator.digest_algorithm') || fail 'missing resource digest algorithm'
test "$package_id" = sage-kit || fail 'unexpected package id'
printf '%s\n' "$package_version" | grep -Eq '^[0-9]{4}\.[0-9]{1,2}\.[0-9]{1,2}\.[0-9]+$' || fail 'invalid package version'
test "$release_identity" = "v$package_version" || fail 'release identity does not match package version'
test "$digest_algorithm" = sha256-utf8-canonical-lf || fail 'unexpected resource digest algorithm'
grep -Eq '"(git_commit|source_root|checkout_path)"[[:space:]]*:' "$manifest" && fail 'manifest contains non-portable or self-referential provenance'

entries=$(mktemp)
links=$(mktemp)
package_entries=$(mktemp)
actual_package_files=$(mktemp)
locators=$(mktemp)
trap 'rm -f "$entries" "$links" "$package_entries" "$actual_package_files" "$locators"' EXIT HUP INT TERM

if command -v jq >/dev/null 2>&1; then
  jq -er '.resources | if type == "array" and length == 10 then . else error("expected 10 resources") end | .[] | [.logical_path, .package_path, .sha256] | @tsv' "$manifest" | tr '\t' '|' | tr -d '\r' > "$entries" || fail 'invalid resource inventory'
else
  index=0
  while [ "$index" -lt 10 ]; do
    logical=$(json_value "$manifest" ".resources[$index].logical_path" "resources.$index.logical_path") || fail "missing logical resource at index $index"
    packaged=$(json_value "$manifest" ".resources[$index].package_path" "resources.$index.package_path") || fail "missing package resource at index $index"
    digest=$(json_value "$manifest" ".resources[$index].sha256" "resources.$index.sha256") || fail "missing resource digest at index $index"
    printf '%s|%s|%s\n' "$logical" "$packaged" "$digest" >> "$entries"
    index=$((index + 1))
  done
  if json_value "$manifest" '.resources[10].logical_path' 'resources.10.logical_path' >/dev/null 2>&1; then
    fail 'unexpected packaged resource count'
  fi
fi

while IFS='|' read -r logical packaged digest; do
  case "$logical|$packaged" in *'../'*) fail "resource path escapes package: $logical" ;; esac
  case "$packaged" in references/framework/*) ;; *) fail "resource is not package-local: $logical" ;; esac
  printf '%s\n' "$digest" | grep -Eq '^[0-9a-f]{64}$' || fail "invalid resource digest: $logical"
  canonical=$repo_root/$logical
  package_file=$skill_root/$packaged
  test -f "$canonical" || fail "missing canonical source: $logical"
  test -f "$package_file" || fail "missing packaged resource: $logical"
  test "$(canonical_sha256 "$canonical")" = "$digest" || fail "canonical digest mismatch: $logical"
  test "$(canonical_sha256 "$package_file")" = "$digest" || fail "package digest mismatch: $logical"
done < "$entries"

test "$(cut -d '|' -f 1 "$entries" | sort -u | wc -l | tr -d ' ')" -eq 10 || fail 'duplicate or incomplete logical resource inventory'
expected='contracts/graph/v1/contract.json
contracts/graph/v1/graph.schema.json
contracts/graph/v1/node-result.schema.json
docs/SAGE_CORE.md
docs/agent/AGENT_HARNESS.md
docs/agent/CLAIM_EVIDENCE_TRUST.md
docs/agent/EXECUTION_ECONOMY.md
docs/agent/GOVERNANCE_LEVELS.md
docs/agent/SESSION_ORCHESTRATION.md
docs/templates/AGENTS_SAGE_BOOTSTRAP_TEMPLATE.md'
test "$(cut -d '|' -f 1 "$entries" | sort)" = "$(printf '%s\n' "$expected" | sort)" || fail 'packaged resource inventory mismatch'

if command -v jq >/dev/null 2>&1; then
  jq -er '.package_files | if type == "array" and length > 0 then . else error("missing package files") end | .[] | [.package_path, .sha256] | @tsv' "$manifest" | tr '\t' '|' | tr -d '\r' > "$package_entries" || fail 'invalid package file inventory'
else
  index=0
  while package_path=$(json_value "$manifest" ".package_files[$index].package_path" "package_files.$index.package_path" 2>/dev/null); do
    package_digest=$(json_value "$manifest" ".package_files[$index].sha256" "package_files.$index.sha256") || fail "missing package file digest at index $index"
    printf '%s|%s\n' "$package_path" "$package_digest" >> "$package_entries"
    index=$((index + 1))
  done
  test "$index" -gt 0 || fail 'package file inventory is missing'
fi

while IFS='|' read -r package_path package_digest; do
  case "$package_path" in skill-manifest.json) fail 'manifest must not inventory itself' ;; *'../'*) fail "package file path escapes package: $package_path" ;; esac
  printf '%s\n' "$package_digest" | grep -Eq '^[0-9a-f]{64}$' || fail "invalid package file digest: $package_path"
  test -f "$skill_root/$package_path" || fail "missing package file: $package_path"
  test "$(canonical_sha256 "$skill_root/$package_path")" = "$package_digest" || fail "package file digest mismatch: $package_path"
done < "$package_entries"
package_count=$(wc -l < "$package_entries" | tr -d ' ')
test "$(cut -d '|' -f 1 "$package_entries" | sort -u | wc -l | tr -d ' ')" -eq "$package_count" || fail 'duplicate package file inventory path'
find "$skill_root" -type f ! -path "$manifest" | while IFS= read -r package_file; do
  printf '%s\n' "${package_file#"$skill_root"/}"
done | sort > "$actual_package_files"
test "$(cut -d '|' -f 1 "$package_entries" | sort)" = "$(cat "$actual_package_files")" || fail 'package file inventory does not exactly match the Skill directory'

while IFS='|' read -r logical packaged digest; do
  package_line=$(awk -F '|' -v path="$packaged" '$1 == path { print; exit }' "$package_entries")
  test -n "$package_line" || fail "resource is absent from package file inventory: $logical"
  test "${package_line#*|}" = "$digest" || fail "resource and package file digests disagree: $logical"
done < "$entries"

while IFS='|' read -r package_path package_digest; do
  case "$package_path" in *.md) ;; *) continue ;; esac
  markdown=$skill_root/$package_path
  locator_start_count=$(grep -Fo 'framework-doc(' "$markdown" 2>/dev/null | wc -l | tr -d ' ')
  : > "$locators"
  grep -Eo 'framework-doc\("[^"[:cntrl:]]+"\)' "$markdown" 2>/dev/null | sed -E 's/^framework-doc\("(.*)"\)$/\1/' > "$locators" || true
  locator_count=$(wc -l < "$locators" | tr -d ' ')
  test "$locator_start_count" -eq "$locator_count" || fail "malformed framework-doc locator: $package_path"
  while IFS= read -r locator || [ -n "$locator" ]; do
    test -n "$locator" || continue
    logical=${locator%%#*}
    if [ "$logical" = "$locator" ]; then anchor=''; else anchor=${locator#*#}; fi
    printf '%s\n' "$logical" | grep -Eq '^[A-Za-z0-9._-]+(/[A-Za-z0-9._-]+)+$' || fail "malformed framework-doc path: $locator"
    if [ -n "$anchor" ]; then printf '%s\n' "$anchor" | grep -Eq '^[A-Za-z0-9._-]+$' || fail "malformed framework-doc anchor: $locator"; fi
    resource_line=$(awk -F '|' -v path="$logical" '$1 == path { print; exit }' "$entries")
    test -n "$resource_line" || fail "framework-doc locator is absent from manifest: $locator"
    target_relative=$(printf '%s\n' "$resource_line" | cut -d '|' -f 2)
    target=$skill_root/$target_relative
    test -f "$target" || fail "framework-doc target is missing: $locator"
    if [ -n "$anchor" ]; then grep -Fq "<a id=\"$anchor\"></a>" "$target" || fail "framework-doc anchor is missing: $locator"; fi
  done < "$locators"
done < "$package_entries"

bootstrap=$skill_root/references/framework/docs/templates/AGENTS_SAGE_BOOTSTRAP_TEMPLATE.md
sed 's/\r$//' "$bootstrap" | tr '\n' ' ' | grep -Eq 'package identity[[:space:]]+and selected[[:space:]]+resource digest' || fail 'bootstrap handoff omits package identity or selected resource digest'
grep -Fq 'never the activation marker' "$bootstrap" || fail 'bootstrap handoff does not prohibit activation-marker propagation'

# Manifest-owned canonical Markdown is closed recursively. Project-owned and
# explicitly source-archive-only links live outside this manifest set.
while IFS='|' read -r logical packaged digest; do
  case "$logical" in *.md) ;; *) continue ;; esac
  source_file=$skill_root/$packaged
  : > "$links"
  grep -Eo '!?(\[[^]]*\])\([^)]+\)' "$source_file" 2>/dev/null | sed -E 's/^!?\[[^]]*\]\(([^)]+)\)$/\1/' > "$links" || true
  while IFS= read -r target || [ -n "$target" ]; do
    test -n "$target" || continue
    case "$target" in http://*|https://*|mailto:*|/*) continue ;; esac
    case "$target" in
      \#*) target_file=$source_file; anchor=${target#\#} ;;
      *)
        relative=${target%%#*}
        if [ "$relative" = "$target" ]; then anchor=''; else anchor=${target#*#}; fi
        target_file=$(dirname "$source_file")/$relative
        ;;
    esac
    test -f "$target_file" || fail "broken packaged Markdown link: $logical -> $target"
    target_real=$(CDPATH= cd -- "$(dirname "$target_file")" && pwd -P)/$(basename "$target_file")
    case "$target_real" in "$framework_root"/*) ;; *) fail "packaged Markdown link escapes framework resources: $logical -> $target" ;; esac
    target_relative=${target_real#"$skill_root"/}
    grep -Fq "|$target_relative|" "$entries" || fail "packaged Markdown link target is absent from manifest: $logical -> $target"
    if [ -n "$anchor" ]; then
      grep -Fq "<a id=\"$anchor\"></a>" "$target_real" || fail "missing packaged Markdown anchor: $logical -> $target"
    fi
  done < "$links"
done < "$entries"

printf 'portable Skill references: 10 resources, %s package files, and Markdown closure verified\n' "$package_count"
