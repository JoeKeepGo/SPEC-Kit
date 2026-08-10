# Claim-Evidence Trust

This document is the canonical owner for capability realization, claim-evidence
trust, current-truth ownership, conditional proof depth, bounded scope
correction, and SAGE-Kit automatic activation. It extends, without restating,
the authority and completion rules in
[`SAGE_CORE.md`](../SAGE_CORE.md#sage-auth-001), the governance matrix in
[`GOVERNANCE_LEVELS.md`](GOVERNANCE_LEVELS.md), and the verification rules in
[`EXECUTION_ECONOMY.md`](EXECUTION_ECONOMY.md#sage-loop-003).
Where older general guidance differs on a topic owned here, this document
controls that topic.

<a id="sage-trust-001"></a>
## Universal Capability Realization

A capability claim follows this realization path:

```text
Requirement -> Implementation -> Composition -> Reachability -> Execution
            -> Observable Outcome -> Delivery -> Recovery/Boundary
```

The links mean:

| Link | Question answered |
|---|---|
| Requirement | What behavior or outcome is authorized and required? |
| Implementation | Does the local implementation exist and satisfy its local contract? |
| Composition | Is it wired, configured, registered, or assembled with its collaborators? |
| Reachability | Can the intended caller, trigger, or consumer reach it through the real entry path? |
| Execution | Does that path execute successfully for the stated conditions? |
| Observable Outcome | Can the relevant user, operator, client, or downstream system observe the claimed result? |
| Delivery | Is the capability present and usable in the claimed package, deployment, migration target, or consumption environment? |
| Recovery/Boundary | Do claimed failure, rollback, permission, safety, compatibility, or durability boundaries hold? |

`Delivery` and `Recovery/Boundary` are required only when the claim includes
them. Evidence for one link cannot be promoted into evidence for later links.
In particular, local implementation evidence is never sufficient evidence for
the complete capability.

This rule is technology-neutral. For example:

- a rendered UI control does not prove its action is wired, reachable, usable,
  or delivered;
- a unit-tested API handler does not prove route registration, middleware,
  serialization, deployment, or client-visible behavior;
- a worker function does not prove queue or scheduler registration, message
  consumption, retry behavior, or an observable result;
- an event schema or publisher does not prove broker delivery, subscriber
  execution, ordering, or the downstream effect;
- a migration file that parses does not prove target application,
  compatibility, rollback, or the resulting data behavior;
- package source that compiles does not prove manifest inclusion, artifact
  construction, installation, startup, or consumer reachability; and
- a security check in isolation does not prove enforcement at every claimed
  boundary or resistance to an alternate path.

## Claim-Evidence Trust Model

Every material claim is evaluated along three independent dimensions. Record
them only when the distinction affects a decision; a compact table is enough.
The dimensions do not grant permission, declare completion, or create human
acceptance.

### Realization Depth

Use the highest depth fully supported for the specific claim. A later depth
includes all earlier applicable links; it cannot be inferred by skipping one.

| Value | Meaning |
|---|---|
| `SPEC_ONLY` | The requirement or intended outcome is specified, but no realization evidence is claimed. |
| `IMPLEMENTATION_VERIFIED` | The local implementation and its local contract have been checked. |
| `COMPOSITION_VERIFIED` | Required registration, configuration, assembly, and collaborator wiring have been checked. |
| `INTEGRATION_VERIFIED` | The intended entry path is reachable and executes across the relevant integrated boundaries with an observable technical result. |
| `DELIVERY_VERIFIED` | The claimed package, deployment, migration target, or consumption path contains and can run the capability. |
| `PRODUCT_OUTCOME_VERIFIED` | Evidence demonstrates the stated user or product outcome at the fidelity required by current acceptance criteria. This remains evidence for, not an act of, human acceptance. |

### Target Fidelity

Target fidelity states what was actually exercised. It must not be upgraded
because an environment merely resembles a later target.

| Value | Meaning |
|---|---|
| `static` | Inspection or analysis without executing the capability. |
| `mock` | Replaced collaborators or boundaries control the observed behavior. |
| `fixture` | Fixed project-owned examples or datasets drive the check. |
| `synthetic` | Generated or simulated inputs, traffic, users, or environments drive the check. |
| `integrated` | Real relevant components execute together in a non-delivery target. |
| `packaged` | The produced artifact is installed, started, or consumed through its package boundary. |
| `production-equivalent` | A non-production target matches every production characteristic relevant to the claim, and those characteristics are named. |
| `production` | The actual production target is observed under separately authorized production access. |

These values describe evidence, not a mandatory ladder. The required fidelity
comes from the claim and acceptance criteria. `production` evidence does not by
itself authorize production work or accept the outcome.

### Evidence Currency

| Value | Meaning |
|---|---|
| `CURRENT` | The evidence is attributable, passed, and still applies to the current claim inputs, scope, revision, and target. |
| `HISTORICAL_ONLY` | The evidence preserves an immutable prior event or acceptance, but current applicability has not been established. |
| `STALE` | The evidence may once have applied, but age or input uncertainty prevents current reliance. |
| `INVALIDATED` | A relevant change, contradiction, or superseding result is known to have broken its applicability. |
| `NOT_EVALUATED` | No applicable evaluation has been performed. |
| `NON_PASS` | The applicable check or review failed, was incomplete, was skipped, or was unavailable; it is not positive evidence. |

Historical acceptance is an immutable event. It is not a warranty of current
reliability and must not be rewritten when later evidence changes. A hash,
receipt, signature, schema match, or contract-compliance result proves only the
property it actually checked; none automatically proves runtime behavior,
product outcome, or usability.

When an input changes, invalidate only affected claims. Trace the changed
implementation, wiring, entry path, target, contract, or acceptance input to
the claims that depend on it, then replace or re-run only their evidence. Do
not reopen all accepted history or replay unrelated proof.

## Current Truth Ownership

One fact has one owner:

| Fact class | Canonical owner |
|---|---|
| Objective, normative authority, permission, acceptance criteria or decision, and next intent | The project-owned current authority and planning documents |
| Branch, `HEAD`, and dirty state | Git at observation time |
| Runtime identity, version, configuration, and process state | The observed runtime at observation time |
| Test, review, or check result | The producing test system, review record, or command output for its bound inputs |
| Artifact identity, contents, manifest, and build receipt | The observed artifact and its producing system |

`ACTIVE_CONTEXT` is a compact routing and handoff snapshot. Every copied
machine fact must carry an `observed-at` time and enough source identity to
refresh it. The snapshot cannot override Git, a runtime, a test result, or an
artifact. Project documents remain authoritative for intent and decisions;
machines remain authoritative for facts they expose.

Accordingly, older references to `ACTIVE_CONTEXT` as the exclusive owner of
current facts mean that it owns the durable snapshot, not the underlying
machine observations.

On mismatch, refresh or correct the snapshot directly. Block only an
acceptance or submit node whose decision depends on the incorrect fact. Do not
expand the mismatch into a full review of unrelated claims, history, or work.

## Lightweight Kernel And Proof Admission

The universal kernel contains only:

1. authority and scope;
2. congruence between the claim and its evidence;
3. observed facts from their canonical owners;
4. affected-claim-only invalidation; and
5. genuine blockers.

Everything else is conditional. Admit proof to the depth of the capability
claim: local behavior may stop at implementation evidence; wiring claims need
composition evidence; reachable cross-boundary behavior needs integration
evidence; artifact or deployment claims need delivery evidence; and user or
product claims need product-outcome evidence at the acceptance-required
fidelity. Boundary, recovery, security, migration, or compatibility proof is
added only when that property is claimed or changed.

Do not create a matrix for every task, run E2E by default, scan history, or
reconstruct receipts. Product, package, or E2E proof is admitted once for an
unchanged final candidate only when at least one of these is true:

- the capability is being established for the first time;
- relevant wiring, entry paths, or delivered artifacts changed;
- an explicit product gate requires it; or
- release acceptance requires it.

If an admitted final proof's relevant inputs change, its evidence is
invalidated and the successor candidate receives one replacement final run.
Proof does not accumulate merely because work is divided into more milestones.

Finding severity follows the canonical governance policy: P0 and P1 block. P2
blocks only for authority conflict, false-green evidence, an approval gate, a
safety boundary, or failure of a required validator or project check. P3 does
not block. Ordinary wording, status, and EOF defects receive a focused direct
correction instead of expanded review.

## Bounded Scope Correction

An allowlist or frozen task scope is an execution boundary, not design
authority. A route, registration point, adapter, package manifest, or test
owner required to close the already authorized capability may enter a bounded
scope correction when all of these remain unchanged:

- product outcome;
- permission level;
- authority and acceptance owner; and
- public, safety, and security boundaries.

Record the correction and verify only the affected boundary. Return to the
Project Manager when the correction would introduce a new product capability,
permission, safety or security boundary, public contract, or unknown ownership.

## Automatic Activation

SAGE-Kit adoption must not depend on the user writing `$sage-kit` in every
prompt. This replaces explicit-only activation guidance. Explicit invocation
remains an override and diagnostic path.

- A Codex project `AGENTS.md`, or the equivalent automatic project-instruction
  entry for another host, loads the lightweight kernel for project work.
- The complete Skill permits implicit invocation for Standard or Heavy work,
  and for acceptance, review, corrective, or release work.
- The first progress update after activation emits one non-persistent marker:

  ```text
  SAGE_ACTIVE source=<project-entry> governance=<Light|Standard|Heavy> authority=<current-reference> profiles=<selected-or-none>
  ```

- The marker reports routing. It is not a safety, containment, permission, or
  compliance proof. Host-loaded automatic project instructions are the
  foundation of activation.
- A host requires explicit invocation only when it supports neither automatic
  project instructions nor implicit Skill invocation.

The marker is conversational state only. Do not write it to project memory,
receipts, ledgers, or runtime state.

## Hard Cost Ceilings

- Keep one owner for each fact.
- Use at most one compact claim/evidence table when it adds decision value; do
  not create a file per claim.
- Do not load accepted history by default.
- Do not multiply verification by milestone count.
- Reuse evidence whose relevant inputs, scope, revision, and target are
  unchanged.
- Review only the affected boundary.
- Run admitted final expensive proof once per unchanged final candidate.
- Do not add Python, a CLI, hooks, a daemon, scheduler, validator, or other
  framework runtime as an implementation dependency.
- Do not convert project-specific security, GUI, browser, data, package, or
  environment requirements into universal gates.

## Non-Goals

This model does not:

- guarantee host enforcement;
- create a runtime state machine;
- approve a product automatically;
- replace project-native tests or acceptance criteria;
- force Graph or Heavy governance;
- require E2E for every task;
- modify historical closeout or acceptance events; or
- turn evidence metadata into proof of behavior or usability.
