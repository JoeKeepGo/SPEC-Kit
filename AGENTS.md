# SAGE-Kit Project Bootstrap

This repository adopts SAGE-Kit. Apply only this lightweight kernel to project
work:

1. **Authority and scope:** The active SPEC and current project authority own
   the normative objective, acceptance, and intent; explicit human decisions
   bound every action.
2. **Claim-evidence congruence:** Support each claim only to the depth and
   fidelity its attributable evidence actually reaches.
3. **Observed-fact ownership:** Read Git, runtime, checks, reviews, and
   artifacts from their canonical observed sources; the active SPEC and current
   project authority own intent and decisions.
4. **Affected-only invalidation:** Invalidate and replace only evidence whose
   relevant inputs changed.
5. **Genuine blockers:** Block only when an authority, permission, required
   input, or required evidence gap prevents safe progress.

Route from these compact risk discriminators before loading the complete Skill:

- **Light:** small, reversible, low-risk, bounded work, normally touching 0-1
  short documents and no authority, safety, security, public-contract,
  migration, production, release, or acceptance boundary. Light review and a
  mechanical wording/status/EOF corrective may remain kernel-only.
- **Standard:** normal multi-file or affected-boundary work, integration or
  package behavior, or materially semantic review/corrective work.
- **Heavy:** concrete authority, safety, security, destructive, production,
  release, irreversible, or broad-integration risk.

For Light work, use only this kernel when current project instructions cover
the task; do not implicitly load the complete Skill unless the user explicitly
overrides this route. For Standard or Heavy work, materially semantic review or
corrective work, and all acceptance or release work, load
`skills/sage-kit/SKILL.md` once per controller context. Reload after compaction
or resume when the prior Skill content is no longer observable. Descendants
inherit the same or narrower boundary; handoffs carry only the compact boundary
and selected profile identity with authority references, never the activation
marker. Do not cause nested Skill reloads or duplicate reviews.

The first progress update after activation emits this non-persistent marker:

SAGE_ACTIVE source=<project-entry> governance=<Light|Standard|Heavy> authority=<current-reference> profiles=<selected-or-none>

It is routing state, not execution, safety, permission, or compliance proof,
and must not be written to project documents, memory, receipts, or ledgers.
Explicit `$sage-kit` invocation remains an override or diagnostic and is the
fallback whenever adoption, current authority, or required Skill content cannot
be observed or resolved through automatic project instructions and implicit
routing.
