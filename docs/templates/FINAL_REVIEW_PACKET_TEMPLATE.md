# Final Review Packet Template

Use this packet only for the one independent final review required by an
explicit Heavy/formal profile or when project authority explicitly selects the
packet. Standard may use one affected review but does not use this formal
packet by default; Light has no independent review by default. Omit conditional
sections and columns that the selected review does not need. Apply
[`CLAIM_EVIDENCE_TRUST.md`](../agent/CLAIM_EVIDENCE_TRUST.md#sage-trust-001)
only to affected material claims.

```markdown
Verdict: `ACCEPTABLE`, `ACCEPTABLE_WITH_CONCERNS`, `NEEDS_CORRECTION`, or `BLOCKED`
Authority and read-only permission:
Review scope / candidate reference:
Acceptance criteria and required project checks:
Evidence inspected and limitations:

| Affected Material Claim ID | Claimed Outcome / Realization Depth | Evidence Fidelity | Evidence Result | Evidence Currency | Substitution Or False-Green Check | Limitation |
|---|---|---|---|---|---|---|
| `<affected claim>` | `<outcome / depth>` | `<fidelity>` | `PASS`, `FAIL`, `INCOMPLETE`, `SKIPPED`, or `UNAVAILABLE` | `CURRENT`, `HISTORICAL_ONLY`, `STALE`, or `INVALIDATED` | `<none or narrower evidence substituted>` | `<limitation or none>` |

| Finding | Severity | Evidence | Blocking reason | Corrective boundary / concern |
|---|---|---|---|---|
| `<id>` | `P0`, `P1`, `P2`, or `P3` | `<ref>` | `<reason or non-blocking>` | `<action>` |

Targeted re-review required for semantic correction:
Remaining concerns:
Recommended next owner/action:
```

P0/P1 always block. P2 blocks only for authority conflict, false-green,
approval gate, safety boundary, or validator/required project-check failure.
P3 never blocks. Mechanical wording, status, and EOF fixes close with a focused
check; semantic correction receives one targeted re-review of the already
reviewed affected boundary. That targeted re-review is sufficient for semantic
changes inside the boundary. Repeat a full review only for permission or
source-authority changes, or broad cross-boundary changes. Review the affected
claims once and reference still-current evidence; do not reconstruct accepted
history or accumulate review by milestone count. `BLOCKED` requires a genuine
authority, permission, required-input, or required-evidence gap.
