# Review And Completion

Preflight host version/configuration, adoption, current authority, and required
Skill content before routing review or completion work. Light review and
mechanical corrective work remain on the project kernel when it is sufficient.
Materially semantic review or corrective work, Standard or Heavy work, and all
acceptance or release work load the complete Skill and this profile once for
the active task. Explicit invocation is the fallback whenever adoption, current
authority, or required Skill content cannot be observed or resolved. Handoff
and closeout load this profile when those same conditions select the full Skill.

Review the active diff against current authority, acceptance criteria, affected
contracts, tests, security boundaries, and evidence. Return one bounded finding
set.

Evaluate capability and evidence claims through
[`CLAIM_EVIDENCE_TRUST.md`](framework/docs/agent/CLAIM_EVIDENCE_TRUST.md). Review
only the affected boundary, and do not let descendants or nested workflows
repeat the same review of an unchanged candidate.

- P0/P1 block.
- P2 blocks only for authority conflict, false-green, approval gate, safety
  boundary, or validator/required project-check failure.
- Ordinary P2 may be accepted with concerns or corrected directly.
- P3 does not block.

Mechanical wording, status, and EOF fixes close with a focused check. Semantic
correctives receive one targeted re-review of the already reviewed affected
boundary. This targeted re-review remains sufficient for semantic changes
inside that boundary. Repeat a full review only after permission or
source-authority changes, or broad cross-boundary changes.

Continue while findings decrease inside the same authorized corrective scope,
without asking for new approval each round. Two consecutive no-progress rounds
for the same root cause trigger strategy reassessment and a diagnostic handoff
that records attempts, observations, and the next decision. Return `BLOCKED`
only when the diagnosis establishes a genuine authority, permission,
required-input, or required-evidence gap that prevents safe progress.

Implementation completion, review verdict, submit authorization, and human
acceptance remain separate. Closeout records the accepted outcome; it never
creates acceptance. A handoff reports authority, changed surfaces, checks,
review evidence, concerns, skipped work, blockers, next action, and next owner.
