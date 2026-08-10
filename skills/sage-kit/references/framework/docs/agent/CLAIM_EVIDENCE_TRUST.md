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

Every material claim is evaluated along four independent dimensions. Record
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

Currency describes only whether evidence remains applicable and timely. It
does not encode the result of the check or review.

| Value | Meaning |
|---|---|
| `CURRENT` | The evidence still applies to the current claim inputs, scope, target, and relevant change history. |
| `HISTORICAL_ONLY` | The evidence preserves an immutable prior event or acceptance, but current applicability has not been established. |
| `STALE` | The evidence may once have applied, but age or input uncertainty prevents current reliance. |
| `INVALIDATED` | A relevant change, contradiction, or superseding result is known to have broken its applicability. |

### Evidence Result

Result records what happened independently of currency:

| Value | Meaning |
|---|---|
| `PASS` | The completed check or review supports the property it evaluated. |
| `FAIL` | The completed check or review contradicts the property it evaluated. |
| `INCOMPLETE` | The check or review began but did not produce a complete result. |
| `SKIPPED` | The applicable check or review was intentionally not run. |
| `UNAVAILABLE` | The applicable check or review could not be run or obtained. |

A current `FAIL` is current counterevidence and takes precedence over an older
`PASS` for the same claim inputs. Never ignore applicable current evidence
because its result is not `PASS`.

Historical acceptance is an immutable event. It is not a warranty of current
reliability and must not be rewritten when later evidence changes. A hash,
receipt, signature, schema match, or contract-compliance result proves only the
property it actually checked; none automatically proves runtime behavior,
product outcome, or usability.

Evidence is bound to the revision where it was produced. Reuse at a later
revision does not require the revision SHA to match. Instead, show that the
relevant diff from the bound revision to the current revision leaves every
input to the claim unchanged, including applicable implementation, wiring,
entry path, target, contract, and acceptance inputs.

When an input changes, invalidate only affected claims. Trace the changed
implementation, wiring, entry path, target, contract, or acceptance input to
the claims that depend on it, then replace or re-run only their evidence. Do
not reopen all accepted history or replay unrelated proof.

## Current Truth Ownership

One fact has one owner:

| Fact class | Canonical owner |
|---|---|
| Normative objective, authority, permission, acceptance criteria or decision, and project intent | The active SPEC and project-owned current authority/planning documents |
| Stable project-level claim definitions: Claim ID, supported entry, observable outcome, delivery/recovery scope, and required depth/fidelity | The project's capability map instantiated from `docs/templates/CAPABILITY_MAP_TEMPLATE.md` |
| Branch, `HEAD`, and dirty state | Git at observation time |
| Runtime identity, version, configuration, and process state | The observed runtime at observation time |
| Test, review, or check result | The producing test system, review record, or command output for its bound inputs |
| Artifact identity, contents, manifest, and build receipt | The observed artifact and its producing system |

`ACTIVE_CONTEXT` owns only the compact coordination snapshot: current status,
findings, blockers, next action, and authority/evidence references. Every copied
machine fact must carry an `observed-at` time and enough source identity to
refresh it. The snapshot cannot override the active SPEC, project authority,
Git, a runtime, a test result, or an artifact.

On mismatch, the owner of the project-selected `ACTIVE_CONTEXT` path may refresh
or correct it only with write permission. A read-only actor returns a bounded
proposed update to that owner. Block only an acceptance or submit node whose
decision depends on the incorrect fact. Do not expand the mismatch into a full
review of unrelated claims, history, or work.

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
reconstruct receipts. Product, package, or E2E proof is admitted only when
both conditions hold:

1. the claim or its acceptance criteria require that proof class; and
2. at least one of these run conditions applies:

   - that required proof class is being established for the claim for the
     first time;
   - any relevant claim input changed, including implementation, wiring, entry
     path, target, contract, acceptance input, or delivered artifact;
   - an explicit product gate requires it; or
   - release acceptance requires it.

A new claim that requires only implementation proof does not by itself admit
product, package, or E2E proof. Run admitted expensive proof once for the
unchanged final candidate.

If an admitted final proof's relevant inputs change, its evidence is
invalidated and the successor candidate receives one replacement final run.
Proof does not accumulate merely because work is divided into more milestones.

Finding severity follows the canonical governance policy: P0 and P1 block. P2
blocks only for authority conflict, false-green evidence, an approval gate, a
safety boundary, or failure of a required validator or project check. P3 does
not block. Ordinary wording, status, and EOF defects receive a focused direct
correction instead of expanded review.

## Bounded Scope Correction

Bounded scope correction applies only to a model-derived allowlist for an
already authorized capability or to a closure range that authority explicitly
preauthorized for correction. Within either case, a route, registration point,
adapter, package manifest, or test owner in the same capability ownership
boundary may enter the correction when all of these remain unchanged:

- product outcome;
- permission level;
- authority and acceptance owner; and
- public, safety, and security boundaries.

An explicit path scope frozen by a human or project authority is itself an
authority boundary for this purpose. Never expand it automatically. Return any
proposed addition to that authority even when it belongs to the same capability
owner and would otherwise qualify as closure work.

Record the correction and verify only the affected boundary. Return to the
Project Manager when the correction would introduce a new product capability,
permission, safety or security boundary, public contract, or unknown ownership.

## Automatic Activation

SAGE-Kit adoption must not depend on the user writing `$sage-kit` in every
prompt. This replaces explicit-only activation guidance. Explicit invocation
remains an override and diagnostic path.

- An adopted Codex project `AGENTS.md`, or equivalent host project-instruction
  entry, is expected to load the lightweight kernel when adoption preflight and
  current host version/configuration evidence confirm that behavior.
- The complete Skill permits implicit invocation for Standard or Heavy work,
  materially semantic review or corrective work, and all acceptance or release
  work, once per controller context. It may reload after compaction or resume
  when the prior content is no longer observable.
- Light work, including Light review and mechanical wording/status/EOF
  corrective work, uses only the project kernel unless the user explicitly
  overrides that route.
- The first progress update after activation emits one non-persistent marker:

  ```text
  SAGE_ACTIVE source=<project-entry> governance=<Light|Standard|Heavy> authority=<current-reference> profiles=<selected-or-none>
  ```

- The marker reports routing. It is not a safety, containment, permission, or
  compliance proof and is not handoff content.
- Automatic project instructions and implicit Skill selection are expected host
  capabilities only when adoption preflight and current host version/configuration
  evidence establish them; they are not unconditional guarantees.
- Explicit invocation is the required fallback whenever adoption, current
  authority, or required Skill content cannot be observed or resolved through
  those routes.

The marker is conversational state only. Do not write it to project memory,
receipts, ledgers, runtime state, or handoffs. A handoff carries only the compact
authority boundary and selected profile identity needed by its recipient.

## Hard Cost Ceilings

- Keep one owner for each fact.
- Use at most one compact claim/evidence table when it adds decision value; do
  not create a file per claim.
- Do not load accepted history by default.
- Do not multiply verification by milestone count.
- Reuse evidence at a later revision only when the relevant diff from its bound
  revision leaves the claim inputs, scope, and target unchanged.
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
