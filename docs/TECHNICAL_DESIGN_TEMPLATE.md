# Technical Design Template

Use this document to describe how the project is structured and how major
components interact. Route material capability claims through
[`CLAIM_EVIDENCE_TRUST.md`](agent/CLAIM_EVIDENCE_TRUST.md#sage-trust-001).

## Architecture Summary

Describe the target architecture in a few paragraphs.

## Components

| Component | Claim IDs | Owns | Composition / Wiring | Does Not Own |
|---|---|---|---|---|
| `<component>` | `<CLAIM-...>` | `<responsibilities>` | `<registration, configuration, collaborators>` | `<non-responsibilities>` |

## Data Ownership

Describe durable state, temporary state, derived state, external data, and
exports. If the project has no durable data, state that explicitly.

## Public Contracts

| Contract | Claim IDs | Owner | Supported Entry / Consumers | Required Evidence Depth / Fidelity |
|---|---|---|---|---|
| `<contract>` | `<CLAIM-...>` | `<owner>` | `<entry path and consumers>` | `<depth / fidelity>` |

## Runtime Boundaries

Describe processes, services, CLIs, jobs, workers, devices, databases, queues,
or other runtime boundaries that apply to this project.

Use `not applicable` only with a reason when the project has no runtime
boundary. For each applicable claim, name the path to its observable outcome
and any delivery or recovery boundary the claim includes.

## Error Handling

Describe how failures are surfaced, logged, retried, denied, or escalated.

## Security And Privacy

Describe secrets, credentials, local data, production data, permissions, and
redaction boundaries.

## Testing Strategy

Describe unit, contract, integration, runtime, UI, security, and release checks
that apply to this project.

## Non-Goals

List architectural choices or scopes that are explicitly not part of the
current project direction.
