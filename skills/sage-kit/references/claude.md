# Claude Code

Use Claude Code agents, tool permissions, and optional hooks as host adapters
to the same project authority. The generic agents do not bind hooks by default.

Claude Code is expected to load project `CLAUDE.md` instructions, but not
`AGENTS.md` directly, when adoption preflight confirms the current host version
and configuration do so. A consumer can keep one bootstrap by adding this to
its project `CLAUDE.md`:

```markdown
@AGENTS.md
```

Model-invocable Skills are selected from their descriptions when relevant.
With SAGE-Kit installed and model invocation enabled, use the project bootstrap
for Light work, Light review, and mechanical corrective work. Load the complete
Skill for Standard or Heavy, materially semantic review/corrective, acceptance,
or release work once per controller context; reload after compaction or resume
when the prior content is no longer observable. Explicit invocation remains an
override and diagnostic and is required whenever adoption, current authority,
or required Skill content cannot be observed or resolved through those routes.

`CLAUDE.md` and Skill content are context, not enforced configuration. Claude
subagents do not automatically inherit a parent Skill; pass only the same or
narrower compact SAGE boundary, authority references, and selected profile
identity. Do not pass the activation marker, have descendants re-invoke the
complete Skill, or repeat the same review.

The shipped coder and final-review examples preserve role separation. A project
may explicitly install the path hook only after preflight confirms the host
emits a structured `file_path`, the matching Shell/PowerShell implementation is
available, and project authority supplies exact protected paths through the
newline-separated `SAGE_PROTECTED_PATHS` setting.

The hook is `MANAGED` advisory defense for observed structured edit events. It
does not parse Bash command text, resolve symlinks/aliases, cover unobserved
tools, or grant authority. Same-named files outside the exact configured paths
are allowed. A hard boundary requires host-enforced path permissions or a
worker with no shell/write escape path. Run the matching hook test after
installation and report unsupported event shapes as a limitation.

Claude session continuation is not project truth. Reconcile the project-owned
`ACTIVE_CONTEXT` coordination snapshot with the active SPEC/project authority,
repository state, and evidence owners on resume; update it only with ownership
and write permission. Unsupported host features are limitations, not inferred
enforcement.
