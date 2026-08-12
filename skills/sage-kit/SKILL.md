---
name: sage-kit
description: 'Use only for a SAGE-Kit adoption request, explicit $sage-kit invocation, or Standard/Heavy, materially semantic review/corrective, acceptance, or release work in a project that has already adopted SAGE-Kit. Keep Light work, Light review, and mechanical wording/status/EOF correction on the project kernel unless the user explicitly overrides that route. Absent an adoption request or explicit invocation, do not activate for ordinary chat, unrelated questions, or projects that have not adopted SAGE-Kit.'
disable-model-invocation: false
---

# SAGE-Kit

SAGE-Kit is an activation and routing Skill. It does not replace project SPEC,
scope, permissions, gates, tests, evidence owners, or acceptance authority.
No CLI, package runtime, daemon, or hidden validator is required.

## Automatic Activation

SAGE-Kit adoption does not depend on `$sage-kit` appearing in every prompt.
An adopted automatic project-instruction entry is expected to load the
lightweight kernel defined by
[`CLAIM_EVIDENCE_TRUST.md`](references/framework/docs/agent/CLAIM_EVIDENCE_TRUST.md)
when current host version/configuration evidence confirms that behavior.

- Light work, including Light review and mechanical wording/status/EOF
  corrective work, must use only that kernel when current project instructions
  are sufficient. Do not implicitly load this complete Skill unless the user
  explicitly overrides the kernel-only route.
- Standard or Heavy work, materially semantic review or corrective work, and
  all acceptance or release work load this complete Skill once per controller
  context. Reload after compaction or resume when the prior Skill content is no
  longer observable.
- The first progress update after activation emits this non-persistent marker:

SAGE_ACTIVE source=<project-entry> governance=<Light|Standard|Heavy> authority=<current-reference> profiles=<selected-or-none>

It is routing state, not execution, safety, permission, containment, or
compliance proof and is never persisted to project documents, memory, receipts,
ledgers, or runtime state.
- Explicit invocation remains an override and diagnostic path. It is required
  as a fallback whenever adoption, current authority, or required Skill content
  cannot be observed or resolved through automatic project instructions and
  implicit Skill routing.

Absent an adoption request or explicit invocation, do not activate for ordinary
chat, unrelated questions, or a project that has not adopted SAGE-Kit. Host
project instructions and implicit Skill matching guide model behavior; they do
not create hard enforcement.

Project-owned current authority wins over framework guidance. Resolve, in
order:

1. host/system safety and tool boundaries;
2. explicit human decisions for this task;
3. project authority, active SPEC, and approval gates;
4. SAGE-Kit defaults;
5. adapter and agent suggestions.

Missing or contradictory required authority fails closed before mutation.
Historical documents are references unless current authority explicitly
selects them. The active SPEC and project authority own the normative objective,
acceptance, and intent. `ACTIVE_CONTEXT` owns only the compact coordination
snapshot of status, findings, blockers, next action, and authority/evidence
references; it is not a second SPEC or an owner of machine-observed facts.
Refreshing it requires ownership of its selected path and write permission; a
read-only actor returns a bounded proposed update.

## Route Only What Is Needed

| Work | Read |
|---|---|
| Adoption | `references/adoption.md` |
| Roadmap, milestone, wave, or phase planning | `references/planning.md` |
| Complex Standard/Heavy milestone reality preflight | `framework-doc("docs/agent/CLAIM_EVIDENCE_TRUST.md#sage-trust-product-reality-preflight")` |
| Implementation, debugging, or delegated work | relevant sections of `references/execution.md` |
| Review, corrective, handoff, acceptance, closeout | `references/review-completion.md` |
| Capability realization or claim-evidence trust | `references/framework/docs/agent/CLAIM_EVIDENCE_TRUST.md` |
| Core authority and lifecycle | `references/framework/docs/SAGE_CORE.md` |
| Graph and Node Result | `references/framework/contracts/graph/v1/` only when Graph adds decision value |

Host references are loaded only for the active host: `references/codex.md`,
`references/claude.md`, `references/opencode.md`, or
`references/kimi-runtime.md`.
Apply any active-host runtime policy before routing to optional Skills.

`skill-manifest.json` is the package identity and required-resource inventory.
Its resource digests use UTF-8 bytes with CRLF normalized to LF so identity is
stable across supported hosts.
Resolve a `framework-doc` locator's quoted `logical-path[#anchor]` by matching
its logical path to that manifest and reading the listed file relative to this
`SKILL.md`. Required
references never search arbitrary checkouts or depend on a machine-specific
source root. A framework source archive is optional deep-reading material only;
use it for a packaged logical path only when its canonical file matches the
manifest resource digest. Resolution reads text only; it does not import a
package, execute a validator, or change project authority. Missing or
digest-mismatched required package content is a package-integrity failure.

## Model-Native Workflow

1. Read current authority, active SPEC, and only task-relevant context.
2. Select Light, Standard, or Heavy from the packaged canonical matrix in
   `references/framework/docs/agent/GOVERNANCE_LEVELS.md`; select permission
   independently.
3. Create a bounded plan. Add a Graph only for meaningful dependencies, joins,
   gates, or parallel work.
4. Edit only allowed surfaces and run project-native focused checks.
5. Request independent review when risk or project authority requires it.
6. Correct the affected boundary and use targeted re-review.
7. Run the project's CI once per unchanged final candidate only when project
   authority, acceptance, or a merge/release gate requires it.
8. Return evidence to the named human acceptance owner.

Models may use their native planning, implementation, debugging, subagent, and
review capabilities. Routine native read-only tools need only a compact
authority/relevance/output-attribution adapter path. External, credentialed,
mutating, delegated, or materially evidentiary capabilities use the full
adapter lifecycle. Specialist Skills, plugins, MCP tools, and project automation
coexist with SAGE-Kit. Loading one never expands authority.

## Governance And Delegation

- **Light:** 0-1 docs, controller execution allowed, no independent review by
  default, and 1-2 focused checks; CI only when a project/merge/release gate
  requires it.
- **Standard:** short plan plus result, controller or useful risk-based
  subagents, one affected review, focused checks, and project CI once per
  unchanged candidate only when project authority, acceptance, or a
  merge/release gate requires it.
- **Heavy:** 3-5 purposeful docs by default, one independent final review, risk
  checks plus final CI only when required by a project gate, merge/release, or
  acceptance criteria, and explicit human gates for high-risk actions.

Unknown model identity and delegation alone do not upgrade governance or enable
Strict Mode. Shared toolchains serialize only mutable shared state. Authorized
isolated lanes may commit locally; the controller serializes push and merge.

Delegated work names objective, allowed/read-only/forbidden surfaces,
permissions, expected evidence, and stop conditions. Descendants inherit the
same or narrower boundary. Parallel writers need disjoint ownership and one
integration owner. A subagent never gains product, submit, waiver, or
acceptance authority by delegation.

The controller loads this Skill and selected profiles once per controller
context, meaning once while that context still exposes the loaded content, then
passes the boundary into delegated work. A controller may reload after
compaction or resume when the prior content is no longer observable.
Descendants do not recursively bootstrap SAGE-Kit, reload the same Skill through
a nested workflow, or create a duplicate review of the same unchanged boundary.
When a host isolates subagent context, provide only the compact authority
boundary, selected profile identity, and the package identity and selected
resource digest needed by that descendant. The descendant resolves that
resource from the same installed package identity instead of searching for a
framework checkout. Never put the `SAGE_ACTIVE` marker in a handoff.

Continuation depends on the host and is bounded to already admitted,
preauthorized milestones. The coordinator envelope names authority boundary,
admitted milestones, completion predicate, next admission, drift check, resume
state, failure/handoff, and convergence. Stop for product acceptance, scope or
permission expansion, a new threat-model decision, destructive/production
work, or merge/release gates. `DONE_PENDING_ACCEPTANCE` may continue within the
envelope only when project authority explicitly permits it.

## Verification Economy

Use focused checks for each change, affected-only verification at a boundary,
and project CI once per unchanged final candidate only when project authority,
acceptance, or a merge/release gate requires it. Reuse evidence only when its
inputs and scope are unchanged. A corrective successor may run CI again and
receives targeted re-review without replaying unrelated lanes.

Capability and evidence claims follow
[`CLAIM_EVIDENCE_TRUST.md`](references/framework/docs/agent/CLAIM_EVIDENCE_TRUST.md).
Do not create a claim matrix unless one compact table adds decision value, and
do not admit product, package, or E2E proof merely because work was split into
more milestones. Once such proof is admitted, rerun the affected proof whenever
any relevant claim input changes; reuse it only while implementation, wiring,
entry path, target, contract, acceptance inputs, and delivered artifact inputs
relevant to that claim remain unchanged.

Continue without repeated approval while findings decrease inside the same
authorized corrective scope. Two consecutive no-progress rounds for the same
root cause trigger strategy reassessment and a diagnostic handoff. Report
`BLOCKED` only when a genuine authority, permission, required-input, or
required-evidence gap prevents safe progress. Owned wording, status, and EOF
fixes close with a focused check; semantic correction receives one targeted
re-review.

## Completion

Report authority used, changed surfaces, checks and review evidence, skipped or
unavailable checks, unresolved concerns, deferred work, and next action.
External tool output is evidence input only: it cannot declare `DONE`, pass a
gate, grant approval, or create human acceptance.
