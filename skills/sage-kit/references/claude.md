# Claude Code

Use Claude Code agents, tool permissions, and optional hooks as host adapters
to the same project authority. The generic agents do not bind hooks by default.

Claude Code loads project `CLAUDE.md` instructions automatically; it does not
load `AGENTS.md` directly. A consumer can keep one bootstrap by adding this to
its project `CLAUDE.md`:

```markdown
@AGENTS.md
```

Model-invocable Skills are selected from their descriptions when relevant.
With SAGE-Kit installed and model invocation enabled, use the project bootstrap
for Light work and implicitly load the complete Skill for Standard or Heavy,
acceptance, review, corrective, or release work. Explicit invocation remains
an override and diagnostic. It is required only when neither automatic project
instructions nor implicit Skill invocation is available.

`CLAUDE.md` and Skill content are context, not enforced configuration. Claude
subagents do not automatically inherit a parent Skill; pass the same or
narrower SAGE boundary explicitly and preload only the profile a descendant
needs. Do not have descendants re-invoke the complete Skill or repeat the same
review.

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
handoff snapshot with repository state and evidence owners on resume.
Unsupported host features are limitations, not inferred enforcement.
