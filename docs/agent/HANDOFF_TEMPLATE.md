# Handoff Template

A handoff is a bounded transfer view, not current truth, acceptance, or an
immutable history record. The active SPEC and project authority retain the
normative objective, intent, and acceptance criteria. Current coordination
status, findings, blockers, next action, and references remain in
`ACTIVE_CONTEXT`.

```markdown
Transfer snapshot disposition: `HANDOFF`, `DONE`, `DONE_WITH_CONCERNS`, `DONE_PENDING_ACCEPTANCE`, or `BLOCKED`

Authority / permission references:
ACTIVE_CONTEXT reference:
Scope and changed surfaces:
Evidence and project-check references:
Review result / remaining non-blocking concerns:
Skipped or unavailable checks:
Next owner:
Transfer instruction:
```

The transfer disposition is not current status. `HANDOFF` and `BLOCKED` are
nonterminal and not acceptance eligible. `DONE`
uses the canonical completion rule at
`docs/SAGE_CORE.md#sage-completion-001`. `DONE_WITH_CONCERNS` cannot
auto-advance. `DONE_PENDING_ACCEPTANCE` may continue only inside an explicit
preauthorized milestone envelope; it does not create product acceptance.

A read-only actor returns a bounded proposed `ACTIVE_CONTEXT` update to its
named owner; it does not write the update directly.
