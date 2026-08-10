# Capability Map

Use this optional file when broad discovery, claim stability, or roadmap
decomposition needs a project-level view. Do not require it before an
executable roadmap when the active SPEC or acceptance criteria already own
sufficient compact claims and review references.

When project authority selects this template as the canonical project-level
claim catalog, maintain each stable Claim ID, supported entry, observable
outcome, delivery/recovery scope, and required evidence depth/fidelity here.

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
- cannot name a bounded ownership or contract surface by execution admission;
- cannot name its supported entry or applicable composition/wiring; or
- cannot name the required evidence depth/fidelity when that distinction
  affects acceptance.

| Candidate Milestone | Status | Reason | Required Split |
|---|---|---|---|
| `<candidate>` | `PASS` or `FAIL` | `<reason>` | `<split or n/a>` |

## Roadmap Promotion

Promote only `PASS` candidates into the project-selected roadmap.

Failed candidates stay in planning until they are reshaped into independently
acceptable, verifiable, and bounded product outcomes. A cohesive vertical
slice may span UI, API, data, runtime, integration, and review activities.
