# Quality Gates Template

Use this template to record project-owned gates. General completion is
canonical at `docs/SAGE_CORE.md#sage-completion-001`; governance and severity
are canonical at `docs/agent/GOVERNANCE_LEVELS.md`. This file selects local
checks and evidence but does not invent product requirements. Claim/evidence
trust is canonical at
[`CLAIM_EVIDENCE_TRUST.md`](agent/CLAIM_EVIDENCE_TRUST.md#sage-trust-001).

## Universal Controls

Only these controls are universal:

| Control | Required result |
|---|---|
| Authority | Current project authority and permission cover the action. |
| Scope | Changed and inspected surfaces stay inside the authorized boundary. |
| Truthful claim/evidence | Results, omissions, limitations, and unavailable checks are accurate; evidence is current for affected claim inputs and asserts no greater realization depth or target fidelity than was checked. |
| Required project checks | The named check owner reports the result; the check passes or the separately named human waiver authority records an explicit waiver. |
| Credentials and host safety | Credentials are not exposed; host/tool safety boundaries are respected. |

A failure in any applicable universal control blocks acceptance. No milestone,
wave, coder split, packet, structural, adapter, Graph, or project security gate
is universal.

## Conditional Profiles

Enable only profiles selected by project authority or concrete scope/risk:

| Profile | Enable when selected or applicable |
|---|---|
| Milestone planning | An independently acceptable product outcome needs milestone planning. |
| Wave or parallel lanes | Disjoint work benefits from parallel execution. |
| Session/controller split | Separate controller, coder, or review roles add value. |
| Packets or structural gate | A Heavy/formal workflow requires structured handoff completeness. |
| Capability adapter | A specialist capability is actually used. |
| Graph | Dependencies, joins, or gates improve a decision. |
| Security, browser, data, redaction, or threat model | The project's own requirements select these checks. |
| Release, migration, or production | The project has a corresponding durable/public change or gate. |

Browser visibility, data handling, redaction, and threat-model questions are
optional prompts for the project owner. SAGE-Kit never turns them into a
requirement, gate, or threat-model decision by itself. Product outcomes, GUI,
security, browser, package/delivery, migration, and recovery checks are likewise
admitted only when the project claim or gate requires them; no capability is
automatically upgraded to E2E proof. Once product, package, or E2E proof is
admitted, rerun the affected proof whenever any relevant claim input changes.

## Local Gate Table

| Gate | Required by | Status | Evidence | Blocking | Check Owner | Waiver Authority | Acceptance Owner | Acceptance Decision Ref | Notes |
|---|---|---|---|---|---|---|---|---|---|
| `<project gate>` | `<authority ref>` | `PASS`, `FAIL`, `BLOCKED`, `WAIVED`, or `N/A` | `<evidence ref>` | `<yes/no>` | `<check owner>` | `<named human or n/a>` | `<named human or n/a>` | `<accepted, rejected, pending, or n/a + ref>` | `<notes>` |

`PASS` requires checked evidence from the check owner. `WAIVED` requires an
explicit decision by the named human waiver authority. Check ownership does not
grant waiver authority. The named human acceptance owner and acceptance decision
remain separate from both. Missing, `FAIL`, or `BLOCKED` evidence for a blocking
gate is not acceptance eligible. `N/A` records why the project gate does not
apply.

## Finding Severity And Correctives

| Severity | Acceptance rule |
|---|---|
| `P0` | Always blocks while open. |
| `P1` | Always blocks while open. |
| `P2` | Blocks only for authority conflict, false-green, approval gate, safety boundary, or validator/required project-check failure; otherwise fix directly or record a concern. |
| `P3` | Never blocks; record as cleanup or follow-up. |

Inside the same authorized corrective scope, continue while findings decrease;
do not request new Project Manager approval each round. Two consecutive
no-progress rounds for the same root cause trigger strategy reassessment and a
diagnostic handoff. Report `BLOCKED` only when a genuine authority, permission,
required-input, or required-evidence gap prevents safe progress. Mechanical
wording, status, or EOF fixes close with a direct focused check. A semantic
corrective receives one targeted re-review of the affected boundary.

## Completion Language

Report the authority reference, `ACTIVE_CONTEXT` reference, applicable gate
table, evidence references, skipped/unavailable checks, and remaining concerns.
Refer to `ACTIVE_CONTEXT` for current status/findings/blockers/next action; read
normative objective, acceptance, and intent from the active SPEC/project
authority. Do not copy those facts into this gate catalog.

Allowed: `Focused checks passed; runtime smoke was not a project requirement for
this documentation-only scope.`

Not allowed: `This should work.`
