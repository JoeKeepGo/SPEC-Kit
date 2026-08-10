# Project Profile Template

Use this file as the default compact zero-to-product blueprint and durable
project boundary. A project may select an equivalent section in another
authority document. Complete only the sections needed for the current
decision, and resolve applicable placeholders before implementation depends on
them.

This profile is self-contained: it can carry the product concept, user journeys,
system boundaries, interfaces, data/runtime ownership, delivery shape, and
acceptance approach without requiring another document. Separate technical
design, capability-map, roadmap, or operational documents are optional when
their additional depth adds decision value.

## Product Summary

Describe what the product does, who it serves, and the primary value it
provides.

## Product Shape And Boundaries

- In-scope product surfaces: `<UI, API, automation, service, package, or other>`
- External systems and actors: `<systems/actors or N/A>`
- System boundary and major components: `<compact component view>`
- Delivery target: `<local, hosted, distributed, package, or project-selected>`
- Explicit exclusions: `<boundary exclusions>`

## Target Users

| User | Need |
|---|---|
| `<user group>` | `<need>` |

## Problems

| ID | Problem |
|---|---|
| `P-001` | `<problem>` |

## Goals

| ID | Goal | Success Signal |
|---|---|---|
| `G-001` | `<goal>` | `<observable signal>` |

## Non-Goals

| ID | Non-Goal | Reason |
|---|---|---|
| `NG-001` | `<excluded scope>` | `<reason>` |

## Constraints

| ID | Constraint | Impact |
|---|---|---|
| `C-001` | `<business, platform, compliance, support, timeline, operational, or technical constraint>` | `<impact>` |

## Product Requirements

Claim ownership: `<compact claims in this profile/active SPEC/acceptance
criteria, or optional project-selected capability-map path>`

Use compact claims here when they are sufficient. A separate capability map is
optional for broad discovery or when a stable project-level claim catalog adds
decision value.

| Requirement ID | Requirement / Compact Claim | Goal IDs | Acceptance / Review Refs |
|---|---|---|---|
| `R-001` | `<required capability, constraint, or observable claim>` | `<G-...>` | `<criterion/review ref>` |

## User Journeys And Supported Entries

| Journey / Actor | Supported Entry | Observable Outcome | Failure / Recovery Expectation |
|---|---|---|---|
| `<journey>` | `<real caller, trigger, or consumption path>` | `<outcome>` | `<expectation or N/A>` |

## Interfaces And Data

| Boundary | Inputs / Outputs | Owner | Contract / Compatibility Need |
|---|---|---|---|
| `<interface, event, store, file, or external service>` | `<I/O>` | `<owner>` | `<need or N/A>` |

## Security And Privacy Boundaries

These are project-owned prompts, not SAGE-Kit requirements. Record only rules
selected by project authority:

- threat model or safety boundary, if any;
- browser/data/redaction rules, if any;
- production or credential approval gates, if any.

Host safety and non-exposure of credentials remain universal; SAGE-Kit does not
invent product security, privacy, browser, or data requirements.

## Runtime And Data Ownership

Describe which component owns durable state, temporary state, external calls,
user-facing status, and exports. If any category does not apply, record `N/A`
with a reason.

## Delivery, Operations, And Recovery

Describe build or delivery targets, environment assumptions, observability,
support, migration, and recovery only where applicable. Durable state, public
contract, migration, or release changes name rollback owner, trigger,
procedure, compatibility impact, and post-rollback verification. Record `N/A`
for categories the product does not claim.

## Milestones And Execution Shape

State the smallest independently acceptable outcome now selected. Add a
separate roadmap, milestone/wave/phase decomposition, or Graph only when
multiple outcomes, dependencies, joins, gates, parallel work, or formal
handoffs make that structure useful.

## Acceptance And Evidence

| Criterion / Claim | Required Evidence Depth / Fidelity | Review Reference / Owner |
|---|---|---|
| `<criterion>` | `<focused check, integration, product, package, E2E, or other>` | `<owner/ref>` |

Project CI is required only when project authority, acceptance criteria, or a
merge/release gate selects it.

## Project-Specific Vocabulary

| Term | Meaning |
|---|---|
| `<term>` | `<definition>` |
