# SAGE-Kit Project Bootstrap

This repository adopts SAGE-Kit. Apply only this lightweight kernel to project
work:

1. **Authority and scope:** Current project authority and explicit human
   decisions bound every action.
2. **Claim-evidence congruence:** Support each claim only to the depth and
   fidelity its attributable evidence actually reaches.
3. **Observed-fact ownership:** Read Git, runtime, checks, reviews, and
   artifacts from their canonical observed sources; project documents own
   intent and decisions.
4. **Affected-only invalidation:** Invalidate and replace only evidence whose
   relevant inputs changed.
5. **Genuine blockers:** Block only when an authority, permission, required
   input, or required evidence gap prevents safe progress.

For Light work, use only this kernel when current project instructions cover
the task; do not implicitly load the complete Skill unless the user explicitly
overrides this route. For Standard or Heavy work, and for acceptance, review,
corrective, or release work, load `skills/sage-kit/SKILL.md` once for the active
task. Descendants inherit the same or narrower boundary; pass that boundary
with delegated work instead of causing nested Skill reloads or duplicate
reviews.

The first progress update after activation emits this non-persistent marker:

SAGE_ACTIVE source=<project-entry> governance=<Light|Standard|Heavy> authority=<current-reference> profiles=<selected-or-none>

It is routing state, not execution, safety, permission, or compliance proof,
and must not be written to project documents, memory, receipts, or ledgers.
Explicit `$sage-kit` invocation remains an override or diagnostic, and is a
fallback only on hosts with neither automatic project instructions nor
implicit Skill invocation.
