# Document Routing Template

This routing guide prevents future sessions from reading the whole documentation
archive by default.

## Default Rule

Read narrow first, then expand only when the task requires it.
Project-selected SPEC sources are valid; their paths are provenance, not
authority. No SAGE-Kit config filename or fixed milestone directory is
required.

Maintain this file as a stable routing table, not a session log. Do not update
it for ordinary task progress.

Context budget is a guardrail, not a correctness cap. Agents may expand beyond
the default read set when correctness, safety, provenance, full milestone
review, or final acceptance requires it, but they must record why the extra
context is needed and what decision it supports.

Default startup read set:

1. Project-selected active SPEC.
2. Compact current-context record, commonly `ACTIVE_CONTEXT`.
3. Project routing record, when one exists.
4. Active milestone or phase authority only when the current task selects it.
5. Applicable project gates, commands, and evidence owners.

## Read Policy By Task

| Task Type | Read First | Expand Only If Needed |
|---|---|---|
| General orientation | Project-selected compact current context, this file | Project-selected roadmap if present and relevant |
| Thin document review | Project-selected active SPEC and compact current context | Referenced project gates and evidence only |
| Governance and authority selection | Active context, this file, `docs/agent/GOVERNANCE_LEVELS.md` | Project-selected milestone, phase, quality, or approval authority only when it exists and applies |
| Project owner intake | `docs/agent/PROJECT_OWNER_ENTRY.md`, project-selected intake if needed, project profile draft if present | Capability-map, technical-design, or roadmap templates only when uncertainty or risk selects them |
| Capability map or roadmap granularity audit | Project profile, active SPEC/acceptance claims or project-selected capability map, quality gates, `docs/agent/MILESTONE_PLANNING.md` | Technical design, relevant profile templates, prior closeouts only when the capability depends on history |
| New feature planning | Project profile, quality gates, `docs/agent/MILESTONE_PLANNING.md` | Technical design if present or risk-enabled; named or relevant prior milestone closeouts, then ledgers only if needed |
| Milestone planning | Project profile, quality gates, `docs/agent/MILESTONE_PLANNING.md` | Technical design or roadmap if present or selected by risk/authority; named or relevant prior milestone closeouts, then ledgers only if needed |
| Session orchestration | Active context, this file, `docs/agent/SESSION_ORCHESTRATION.md` | Project-selected packet or phase authority only when the active profile uses it |
| Worktree isolation | Active context, this file, `docs/agent/WORKTREE_ISOLATION.md` | Branch/worktree ownership and project-selected execution records only when needed |
| External capability routing | Active context, this file, `docs/agent/CAPABILITY_ADAPTERS.md#sage-adp-003`, `docs/agent/AGENT_HARNESS.md`, `docs/agent/GOVERNANCE_LEVELS.md` | Selected skill, plugin, connector, MCP tool, project command, CI, or review instructions only when the task will use that execution method |
| Frontend or browser adapter | Active phase doc, UI contract, quality gates, `docs/agent/CAPABILITY_ADAPTERS.md` | Design system, frontend skill instructions, browser QA tools |
| Runtime implementation | Active milestone and phase docs | Exact contract docs for touched modules |
| UI work | Active phase doc, UI contract, quality gates | Design system |
| Contract change | Contract owner doc and consumer docs | Relevant closeout decision summary, then historical decision records |
| Review | Active SPEC/context, quality gates, changed files | Project-native structured records when explicitly used, prior closeout summary, then ledger evidence |
| Historical outcome lookup | Named project-selected closeout or decision summary | Ledger, phase docs, and completion reports only for provenance |
| Release or publish | Approval gates, release phase doc | Packaging docs |

## Historical Archive Policy

Historical milestones are evidence, not default startup context. Read them only
when:

- the user names the milestone;
- the active doc points to a specific historical decision;
- a review must verify provenance;
- planning needs prior milestone outcomes, gaps, or follow-up decisions;
- implementation touches behavior governed by a historical contract.

When historical context is needed, read the project-selected closeout or
decision summary first. Open historical ledgers, phase docs, completion
reports, or logs only when that summary does not answer the question or the
task requires detailed provenance.

## Expansion Rule

Before opening broad files or long logs, record:

- why the file is needed;
- what symbols, headings, or ranges are needed;
- what decision the read should support.

Prefer targeted reads before full archives:

1. read closeouts before historical ledgers;
2. read capability metadata before capability bodies;
3. search for headings or symbols before reading whole files;
4. read packet templates only when the current task uses that packet.
5. for broad, non-technical, or coarse-roadmap projects, read the project-owner
   intake before optional capability discovery and then the executable roadmap;
   skip intermediate artifacts when the accepted compact blueprint is already
   sufficient.
6. read capability adapter policy before external capability bodies, generated
   skills, hooks, MCP config, or provider documentation.

Do not read every phase doc, historical ledger, closeout, skill body, plugin
body, or log unless the task explicitly requires full milestone review,
provenance, safety analysis, or final acceptance.

## Maintenance Rule

Update this file only when the active permission mode and ownership allow direct
writes and the documentation topology or routing policy changes, such as:

- a required project document is added, removed, renamed, or moved;
- a profile adds a new default read path;
- task types or ownership boundaries change;
- a new archive or historical evidence policy is adopted.

If direct writes are not allowed, return a `Memory Update Proposal` only when a
durable routing change exists.

Do not write task status, command output, review notes, milestone progress, or
agent observations here. Normative objective, intent, and acceptance belong to
the active SPEC or project authority. Compact coordination status, findings,
blockers, next action, and references belong in active context; a read-only
actor returns a bounded proposed update to its named owner. Evidence stays with
its project-native owner; optional ledgers index immutable history, while
packets, completion reports, and handoffs are bounded snapshots that reference
current truth rather than competing with it.

Target size: keep this file compact. If it grows beyond the project routing
budget, split rarely used routes into profile-specific routing notes.
