# Final Review Packet Template

Use for the one independent final review required by Heavy governance or when
project authority explicitly selects a review. Standard uses one affected
review; Light has no independent review by default. Apply
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
check; semantic correction receives one targeted re-review. Review the affected
claims once and reference still-current evidence; do not reconstruct accepted
history or accumulate review by milestone count.
