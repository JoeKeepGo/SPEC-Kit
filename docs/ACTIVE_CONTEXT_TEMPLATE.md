# Active Context

Updated: `<RFC3339 timestamp>`

This owns only the compact coordination snapshot: status, findings, blockers,
next action, and authority/evidence references. The active SPEC and project
authority own the normative objective, intent, and acceptance criteria. This
file does not own underlying machine facts. Follow
[`CLAIM_EVIDENCE_TRUST.md`](agent/CLAIM_EVIDENCE_TRUST.md#sage-trust-001) and
replace changed facts rather than appending a diary.

## Coordination And References

- Objective / intent / acceptance authority reference:
- Status:
- Active SPEC:
- Governance / permission:
- Human acceptance owner:

## Observed Machine Snapshot

- Repository / branch / revision / dirty state (`observed-at`, Git source):
- Runtime identity / version / configuration / process state (`observed-at`,
  source, or `N/A`):
- Project-native test or review result (`observed-at`, producing source, bound
  inputs, and limitations):
- Artifact identity / contents / build receipt (`observed-at`, source, or
  `N/A`):
- Changed surfaces and attributable evidence references:

Direct Git, runtime, test, and artifact observations override a stale or
contradictory snapshot. Refresh only the affected copied facts and claims.

## Decisions And Boundaries

- Current authority references:
- Allowed / read-only / forbidden surfaces:
- Human-only decisions:
- Invariants and stop conditions:

## Current Findings And Blockers

- Findings or concerns:
- Blockers:

## Handoff

- Exact next action:
- Next owner:
- Resume notes:

Ledgers index immutable events/evidence and handoffs provide bounded transfer
views; neither may maintain a competing current status. Do not copy framework
rules, full logs, private reasoning, or accepted history here.

A read-only actor does not refresh this file directly; it returns a bounded
proposed update to the named owner.
