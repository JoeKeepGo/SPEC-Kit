# Continuity And Handoff

Continuity is carried by project-owned current truth, not a framework runtime.

Use a compact `ACTIVE_CONTEXT` containing:

- current objective and active SPEC;
- authority and permission boundaries;
- branch/revision and relevant changed surfaces;
- decisions, blockers, and unresolved findings;
- valid evidence references and known limitations;
- exact next action and next owner.

At handoff, verify each fact at its canonical observed owner using ordinary
project tools: Git for revision and diff state, runtime inspection for live
state, checks for check results, review artifacts for review outcomes, and
project authority for intent and decisions. Repository files are authoritative
only for facts they own. Do not copy full logs, private reasoning, historical
milestone content, or framework rules into `ACTIVE_CONTEXT`.

A resumed model re-reads current project authority and checks whether the handoff
still matches each fact's canonical observed owner. Drift is reported and
reconciled; it is never silently treated as approval or completion.
