# Capability Adapters

<a id="sage-adp-003"></a>
<a id="sage-adp-007"></a>

Capabilities include host-native tools, specialist Skills, plugins, MCP tools,
subagents, browsers, databases, CI, and project automation.

Activation is also host capability routing. Prefer the host's documented
automatic project-instruction entry, then its documented implicit Skill route.
Require explicit invocation only when neither exists. Availability metadata,
project instructions, and model-selected Skill loading are guidance channels;
none proves hard enforcement, execution, safety, or containment.

Use this lifecycle:

1. detect task-relevant capability metadata;
2. confirm project authority permits its use;
3. bind scope, credentials, mutation, and evidence boundaries;
4. invoke the narrow capability;
5. capture attributable output;
6. map output into project evidence;
7. use a safe native fallback when available.

Capability absence is not a blocker when an equivalent safe path exists.
Fallback cannot broaden scope, bypass a gate, change authority, or weaken
verification. External output is evidence input and cannot declare completion
or acceptance.

Map capability and evidence claims only through
[`CLAIM_EVIDENCE_TRUST.md`](CLAIM_EVIDENCE_TRUST.md). Do not infer a later
realization depth from tool availability or successful local output.

Descendants inherit the same SAGE boundary and all restrictions. Pass the
already-selected profiles and boundary into delegated work; nested delegation
must not cause repeated SAGE-Kit loading or duplicate review of an unchanged
boundary. A controller may preauthorize one nested
delegation envelope that names maximum depth, concurrency, permission ceiling,
allowed/read-only/forbidden paths, capability bounds, and stop conditions.
Children may delegate only within the remaining depth and concurrency of that
same envelope. They cannot widen permissions or paths, replace gates, or
redelegate beyond the envelope. No fresh approval is needed for each child;
an envelope breach or unavailable inheritance requires `HANDOFF`. Host
documentation must distinguish enforced restrictions from procedural guidance.
