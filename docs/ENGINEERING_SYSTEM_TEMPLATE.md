# Engineering System Template

Use this file to bind SAGE-Kit to project-owned authority. SAGE-Kit coordinates
within granted scope and never owns product scope, threat model, permissions,
checks, or acceptance.

## Authority And Current Truth

- Active SPEC / project authority:
- Permission and acceptance owners:
- ACTIVE_CONTEXT (compact coordination status, findings, blockers, next action,
  and authority/evidence references; copied machine facts carry `observed-at`
  and source):
- Project-required checks and approval gates:

The active SPEC and project authority own normative objective, intent, and
acceptance. `ACTIVE_CONTEXT` does not override them or direct Git, runtime,
test, review, or artifact facts. A read-only actor returns a bounded proposed
update to its named owner instead of editing it. Current-truth ownership and
refresh rules are canonical at
[`CLAIM_EVIDENCE_TRUST.md`](agent/CLAIM_EVIDENCE_TRUST.md#sage-trust-001).

Historical ledgers are immutable event/evidence indexes. Handoffs are bounded
transfer views. Completion reports reference authority, evidence, and current
truth instead of copying them.

## Control Level

Use the canonical matrix in `docs/agent/GOVERNANCE_LEVELS.md`:

- Light: 0-1 docs, controller may execute, no independent review by default,
  1-2 focused checks, conditional CI;
- Standard: short plan/result, useful risk-based subagents, one affected
  review, focused checks, and CI only when project authority, acceptance
  criteria, or a merge/release gate requires it;
- Heavy: 3-5 purposeful docs by default, one independent final review, risk
  checks and final CI only when selected by a project gate, merge/release, or
  acceptance criteria, plus explicit high-risk human gates.

Permission remains separate. Unknown model identity and delegation alone do not
enable Strict or Heavy. Shared toolchains serialize only mutable shared state;
authorized isolated lanes may commit locally while push/merge remain serial.

## Optional Profiles

Enable Graph, milestone packages, phases, waves, controller/coder split,
packets, structural gates, adapters, browser/data/redaction checks, threat-model
prompts, or legacy compatibility only when project authority or concrete risk
selects them. Planning-only defaults to one author, one bounded risk review if
warranted, and one targeted fix.

## Completion

Apply `docs/SAGE_CORE.md#sage-completion-001`. Mechanical wording, status, or
EOF fixes close with a focused check; semantic correctives receive one targeted
re-review of the already reviewed affected boundary. That is sufficient for
semantic changes inside the boundary; full review is reserved for permission,
source-authority, or broad cross-boundary changes. Continue within the same
corrective authority while findings decrease. Two consecutive same-root
no-progress rounds trigger strategy reassessment and a diagnostic handoff.
Use `BLOCKED` only when a genuine authority, permission, required-input, or
required-evidence gap prevents safe progress.

Stop for product acceptance, scope/permission expansion, a new threat-model or
safety decision, destructive/production work, credentials, merge, or release.
