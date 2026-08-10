# Project Owner Entry

Project Owner Entry is the lightweight SAGE-Kit path for a person who knows the
goal, business need, or user problem but may not know how to describe software
implementation work yet.

It turns an idea into a compact project blueprint and the planning inputs the
idea actually needs. The path is risk proportional: broad or uncertain ideas
may need discovery artifacts before an executable roadmap, while an already
bounded idea may proceed from an accepted profile blueprint directly to a
bounded plan.

## Use When

- the project starts from a non-technical idea;
- the user can describe desired outcomes but not code structure;
- the project needs a safe first SAGE-Kit bootstrap without overwhelming the
  project owner;
- a current roadmap looks too small, too broad, or too module-shaped.

Do not use this path for a narrow implementation task that already has an
accepted phase document.

## Intake Questions

Use only the unanswered parts of these five questions:

1. What do you want to build or change?
2. Who will use it?
3. What problem does it solve right now?
4. What can a user do when it succeeds?
5. What are you most worried about?

Do not repeat questions already answered by current authority. Ask follow-up
questions only when an answer is too vague to produce the compact blueprint,
acceptance criteria, non-goals, or risk notes needed for the next decision.

## Output Sequence

Project Owner Entry always produces or updates the compact project profile
blueprint. Add the remaining outputs only when uncertainty, risk, or project
authority needs them:

1. project owner intake, when the idea is not already bounded;
2. compact project profile blueprint, or an equivalent project-selected
   section;
3. capability map, for broad discovery or claim-catalog value;
4. draft milestone candidates and granularity audit, when multiple outcomes or
   boundaries need decomposition;
5. first executable plan after the owner accepts the selected outcome and
   boundaries.

Any intake, profile draft, capability map, draft candidates, and audit are
planning material. They are not authorization to start implementation. For an
already bounded idea, do not require intermediate documents that add no
decision value.

## Optional Capability Discovery

For broad or uncertain work, consider the capability categories relevant to
the stated goal before creating an executable milestone roadmap:

- user-facing capabilities;
- operator or administrator capabilities;
- data and state capabilities;
- integration capabilities;
- runtime, deployment, or recovery capabilities;
- observability, security, and support capabilities.

These categories are advisory prompts, not product requirements. Include only
capabilities that the project owner or active project SPEC places in scope.
The active SPEC or acceptance criteria may instead own compact capability
claims and review references; no separate capability map is required.
SAGE-Kit must not invent a product threat model, security requirement, safety
property, deployment target, or approval gate. Milestones are derived from
in-scope outcomes. One independently acceptable outcome may include cohesive
UI, API, data, and runtime supporting areas; split unrelated outcomes or
distinct release, authority, or acceptance boundaries.

## Project Owner Responsibilities

The project owner decides:

- whether the goal and user outcome are correct;
- which risks are acceptable;
- which non-goals remain out of scope;
- whether user-visible evidence proves the desired outcome.

The project owner should not be asked to accept implementation claims without
attributable evidence at the depth and fidelity selected by the acceptance
criteria. Focused checks, runtime smoke, review evidence, or visible evidence
are options, not an automatic requirement to produce every class.

## Granularity Guardrail

For broad or uncertain work, Project Owner Entry produces candidate
capabilities and draft milestones before promotion. For an already bounded
idea, the accepted compact blueprint may feed a bounded executable plan
directly. Split a milestone when it cannot be independently accepted and
bounded.

Red flags:

- a milestone combines unrelated product outcomes;
- a milestone crosses scope or permission boundaries without a named decision;
- a milestone contains an independent release or acceptance boundary;
- a milestone cannot name one observable acceptance result;
- a milestone lacks a bounded implementation or contract surface by the point
  execution authority is requested;
- a milestone cannot name the acceptance evidence needed for its claims.

## Capability Adapter Decision

Project Owner Entry may identify likely external capability adapters, such as
frontend skills, OpenSpec, GitNexus, browser QA, database tools, CI, or
reviewers.

Do not install or enable adapters by default during intake. Record them as
planning options until a milestone entry gate or phase authorizes the adapter,
its authorization level, evidence requirement, and required or safe-fallback
behavior.
