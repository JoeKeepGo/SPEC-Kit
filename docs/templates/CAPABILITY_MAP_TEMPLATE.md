# Capability Map

Use this file before creating an executable milestone roadmap, especially when
the project starts from a broad idea or non-technical intake.

The capability map prevents broad epics from being mislabeled as milestones.
Use the claim vocabulary from
[`CLAIM_EVIDENCE_TRUST.md`](../agent/CLAIM_EVIDENCE_TRUST.md#sage-trust-001)
only for material claims where the distinction affects a decision.

## Project Outcome

State the user or operator outcome the project should make possible.

## Capability Areas

| Claim ID | Capability / Owner Boundary | Supported Entry / Composition | Observable Outcome | Delivery / Recovery (if claimed) | Required Evidence Depth / Fidelity | Candidate Milestones |
|---|---|---|---|---|---|---|
| `CLAIM-...` | `<area and owning boundary>` | `<real entry path and wiring>` | `<user/operator result>` | `<boundary or none claimed>` | `<depth / fidelity>` | `<M?>` |

Suggested areas:

- user-facing workflows;
- operator or administrator workflows;
- data and state;
- API, event, CLI, or worker contracts;
- integrations;
- runtime, deployment, recovery;
- observability, diagnostics, support;
- security and privacy.

## Milestone Candidate Split

Each candidate milestone must be an independently acceptable product outcome.
It may combine cohesive UI, API, data, and runtime supporting capabilities.

| Candidate Milestone | Claim IDs | Primary Capability | Observable Result | Contract | Verification | Split Needed |
|---|---|---|---|---|---|---|
| `<candidate>` | `<CLAIM-...>` | `<capability>` | `<result>` | `<contract or none>` | `<test/smoke/evidence>` | `<yes/no + reason>` |

## Granularity Audit

Mark `FAIL` when any candidate milestone:

- combines unrelated product outcomes;
- crosses a distinct release, authority, or acceptance boundary without an
  explicit reason;
- mixes work that cannot share a coherent acceptance decision;
- cannot be reviewed without unrelated history;
- cannot name file ownership;
- cannot name its supported entry or applicable composition/wiring; or
- cannot name the required evidence depth/fidelity when that distinction
  affects acceptance.

| Candidate Milestone | Status | Reason | Required Split |
|---|---|---|---|
| `<candidate>` | `PASS` or `FAIL` | `<reason>` | `<split or n/a>` |

## Roadmap Promotion

Promote only `PASS` candidates into `docs/MILESTONE_ROADMAP.md`.

Failed candidates stay in planning until they are reshaped into independently
acceptable, verifiable, and bounded product outcomes. A cohesive vertical
slice may span UI, API, data, runtime, integration, and review activities.
