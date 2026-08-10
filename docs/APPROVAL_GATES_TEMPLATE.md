# Approval Gates Template

Approval semantics are canonical at `docs/SAGE_CORE.md#sage-auth-009`. This
template offers example rows for project-owned gates, request inputs, and
retained approval evidence. A row becomes an active gate only when project
authority instantiates it or a real host boundary requires it.

## Example Gate Catalog

Delete inapplicable rows. Examples do not create product requirements,
permissions, or approval boundaries.

| Gate | Opens Only When | Required Evidence |
|---|---|---|
| Production credentials | User approves a scoped credential use. | Secret handling plan, redacted logs, no staged secrets. |
| Production data | User approves named inputs and objective. | Data minimization plan, read/write scope, cleanup plan. |
| Destructive action | User approves exact target and rollback. | Backup or rollback evidence and target confirmation. |
| External mutation | User approves service, environment, and action. | Dry-run or fake-provider evidence where possible. |
| Environment capability install | User approves tool, source, files/config it will write, and fallback. | Documentation source read, version/source, write list, assistant target, rollback or uninstall path, no silent hooks, no multi-assistant or global install unless explicitly approved. |
| Release or publish | User approves version and destination. | Build checks, changelog, artifact scan, rollback note. |
| Merge to protected branch | User approves merge after review, when Git or protected branches are used. | Clean branch, fresh checks, no forbidden files staged. |

## Approval Request Format

When approval is required, ask for:

- exact action;
- exact target;
- expected effect;
- rollback or recovery plan;
- verification after completion.

## Agent Rules

- Apply the explicit, target-scoped boundary in
  `docs/SAGE_CORE.md#sage-auth-009` to every gate above.
- Do not run real mutations when the phase says fake, dry, or simulation only.
- Record approval evidence at the project-selected canonical owner; a
  completion report may reference it when that report is selected.
