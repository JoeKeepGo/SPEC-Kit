# M<ID> Milestone: <Name>

Use this optional detailed profile when a milestone is an independently
acceptable product outcome and Standard/Heavy planning benefits from a retained
artifact. One outcome may include cohesive UI, API, data, and runtime support.
Review is normally a gate/node, and becomes its own milestone only for an
independent release, authority, or cross-milestone acceptance boundary. Use
[`CLAIM_EVIDENCE_TRUST.md`](../agent/CLAIM_EVIDENCE_TRUST.md#sage-trust-001)
to interpret the referenced claim and evidence state.

Record only the selected Claim IDs, their catalog reference, and this
milestone's delta and acceptance. Do not copy stable claim entries, supported
outcomes, depth, or fidelity from the catalog.

## Claim Selection And Delta

- Claim catalog reference:
- Claim IDs:
- Delta in this milestone:
- Acceptance for this delta:
- Project authority and acceptance owner:
- Scope / non-goals:
- Governance level and permission mode:
- ACTIVE_CONTEXT:

## Acceptance And Execution

- Acceptance checks for this delta:
- Affected paths/contracts:
- Dependencies and useful serial/parallel boundaries:
- Project-required focused checks and final CI gate, if any:
- Human-only gates:
- Stop conditions:

Use one bounded loop by default. Graph, waves, lanes, controller/coder split,
packets, structural gates, adapters, and separate ledgers are conditional
profiles only. Delegation alone does not select Heavy. A shared toolchain is
serial only while mutable state is shared.

## Supporting Work

| Area | Bounded result | Owner/permission | Paths | Checks | Dependency |
|---|---|---|---|---|---|
| `<UI/API/data/runtime/etc.>` | `<result>` | `<owner/mode>` | `<paths>` | `<checks>` | `<dependency>` |

Split this milestone only if a part cannot be accepted with the same product
outcome, needs a distinct scope/permission decision, or has an independent
release/acceptance boundary.

## Rollback (conditional)

Complete only for durable state, public contract, migration, or release change:

- owner and trigger:
- procedure:
- compatibility impact:
- post-rollback verification:

## Completion And Handoff

Apply `docs/SAGE_CORE.md#sage-completion-001`. Reference authority,
`ACTIVE_CONTEXT`, review/check evidence, and the project acceptance decision;
do not duplicate current status/findings/blockers/next action. A closeout is an
optional historical outcome index after acceptance, not an acceptance engine.
Reuse still-current evidence; supporting work and milestone count do not create
additional final proof runs.
