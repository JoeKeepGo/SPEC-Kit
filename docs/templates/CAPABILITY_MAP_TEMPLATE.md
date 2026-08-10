# Capability Map

Use this file before creating an executable milestone roadmap, especially when
the project starts from a broad idea or non-technical intake.

This template is the canonical project-level claim catalog owner. A project
instantiates one capability map and maintains each stable Claim ID, supported
entry, observable outcome, delivery/recovery scope, and required evidence
depth/fidelity there.

The capability map also prevents broad epics from being mislabeled as
milestones. Use the claim vocabulary from
[`CLAIM_EVIDENCE_TRUST.md`](../agent/CLAIM_EVIDENCE_TRUST.md#sage-trust-001)
only for material claims where the distinction affects a decision.

## Project Outcome

State the user or operator outcome the project should make possible.

## Claim Catalog

| Claim ID | Requirement / Goal Refs | Capability / Owner Boundary | Supported Entry | Observable Outcome | Delivery / Recovery (if claimed) | Required Evidence Depth / Fidelity |
|---|---|---|---|---|---|---|
| `CLAIM-...` | `<R-... / G-...>` | `<area and owning boundary>` | `<real caller, trigger, or consumption path>` | `<user/operator result>` | `<boundary or none claimed>` | `<depth / fidelity>` |

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

| Candidate Milestone | Claim IDs | Cohesive Delta | Independently Acceptable | Split Needed |
|---|---|---|---|---|
| `<candidate>` | `<CLAIM-...>` | `<bounded change>` | `<yes/no + reason>` | `<yes/no + reason>` |

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
