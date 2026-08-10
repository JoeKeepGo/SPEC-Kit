# Technical Design Template

Use this document to describe how the project is structured and how major
components interact. When the project selects a capability or claim map,
stable material claim definitions remain there and this design records only
how their IDs map to composition and delivery implementation.

Capability / claim map reference when selected: `<project-selected path or not applicable>`

## Architecture Summary

Describe the target architecture in a few paragraphs.

## Components

| Component | Owns | Composition / Wiring | Does Not Own |
|---|---|---|---|
| `<component>` | `<responsibilities>` | `<registration, configuration, collaborators>` | `<non-responsibilities>` |

## Conditional Capability Implementation Mapping

Include this section only when the project selects a capability or claim map.
Omit it when the accepted design can proceed directly from project authority.

| Claim ID | Composition / Wiring Implementation | Delivery Implementation (if claimed) |
|---|---|---|
| `<project-selected claim ID>` | `<components, registration, configuration, and entry-path implementation>` | `<package, deployment, migration, or consumption implementation>` |

## Data Ownership

Describe durable state, temporary state, derived state, external data, and
exports. If the project has no durable data, state that explicitly.

## Public Contracts

| Contract | Owner | Consumers |
|---|---|---|
| `<contract>` | `<owner>` | `<consumers>` |

## Runtime Boundaries

Describe processes, services, CLIs, jobs, workers, devices, databases, queues,
or other runtime boundaries that apply to this project.

Use `not applicable` only with a reason when the project has no runtime
boundary. When a capability mapping is selected, connect applicable boundaries
there; do not restate claim outcomes or proof requirements.

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
