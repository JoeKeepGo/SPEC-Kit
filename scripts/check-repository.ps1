$ErrorActionPreference = 'Stop'

$required = @(
    'README.md',
    'docs/SAGE_CORE.md',
    'docs/agent/AGENT_HARNESS.md',
    'docs/agent/CLAIM_EVIDENCE_TRUST.md',
    'docs/agent/GOVERNANCE_LEVELS.md',
    'docs/templates/AGENTS_SAGE_BOOTSTRAP_TEMPLATE.md',
    'AGENTS.md',
    'contracts/graph/v1/contract.json',
    'contracts/graph/v1/graph.schema.json',
    'contracts/graph/v1/node-result.schema.json',
    'contracts/task-dispatch-v2/policy.json',
    'contracts/task-dispatch-v2/task.schema.json',
    'contracts/task-dispatch-v2/evidence.schema.json',
    'contracts/canonical-authority-pointers.txt',
    'skills/sage-kit/SKILL.md'
)
foreach ($path in $required) {
    if (-not (Test-Path -LiteralPath $path -PathType Leaf)) { throw "missing required path: $path" }
}

$tracked = @(git ls-files)
$forbidden = @($tracked | Where-Object {
    $_ -match '(^|/)(pyproject\.toml|setup\.py|setup\.cfg|requirements[^/]*\.txt|tox\.ini|noxfile\.py|package\.json|package-lock\.json|pnpm-lock\.yaml|yarn\.lock)$' -or
    $_ -match '\.(py|pyi|pyc|whl)$' -or $_ -match '\.egg-info/' -or
    $_ -match '(^|/)(bin|src)/(sagekit|sage-kit)(/|$)'
})
if ($forbidden.Count -ne 0) { throw "forbidden runtime/CLI/package surface:`n$($forbidden -join "`n")" }

# Scan executable/workflow surfaces only. Ordinary governance prose may discuss
# runtimes and tests without becoming an executable dependency.
$executionSurfaces = @($tracked | Where-Object {
    $_ -notin @('scripts/check-repository.ps1', 'scripts/check-repository.sh') -and
    (
        $_ -like '.github/workflows/*' -or $_ -like '.claude/*' -or
        $_ -like '.codex/*' -or $_ -like 'scripts/*' -or $_ -like 'tests/*' -or
        $_ -like 'skills/*/agents/*' -or $_ -like 'skills/*/references/*/agents/*' -or
        $_ -like 'skills/*/references/*/hooks/*' -or
        $_ -match '(^|/)(Makefile|Dockerfile|compose[^/]*\.ya?ml|[^/]*(launch|runner|daemon|scheduler|setup|install)[^/]*\.(sh|ps1|bat|cmd|ya?ml|json|toml))$'
    ) -and $_ -match '\.(sh|ps1|bash|zsh|fish|bat|cmd|js|mjs|cjs|ts|tsx|rs|go|java|cs|rb|php|ya?ml|json|toml|md)$|(^|/)(Makefile|Dockerfile)$'
})
if ($executionSurfaces.Count -gt 0) {
    $stale = @(git grep -n -I -E '(^|[;&|()]|run:|command:|exec:|shell:)[[:space:]]*(env[[:space:]]+)?(python([0-9.]*)?|pip([0-9.]*)?|pytest|unittest|sagekit[[:space:]]+(run|validate|check|candidate|checkpoint|resource|packet)|npm|npx|node)[[:space:]]' -- $executionSurfaces)
    if ($LASTEXITCODE -notin 0, 1) { throw 'executable/workflow reference scan failed' }
    if ($stale.Count -ne 0) { throw "forbidden runtime invocation:`n$($stale -join "`n")" }
}

$skill = Get-Content -LiteralPath 'skills/sage-kit/SKILL.md' -Raw
$skillFrontmatter = [regex]::Match($skill, '(?s)\A---\r?\n(?<content>.*?)\r?\n---(?:\r?\n|\z)')
if (-not $skillFrontmatter.Success) { throw 'invalid Skill frontmatter' }
$skillFrontmatterText = $skillFrontmatter.Groups['content'].Value
if ($skillFrontmatterText -notmatch '(?m)^name: sage-kit\r?$') { throw 'missing Skill name' }
$skillDescriptionMatch = [regex]::Match($skillFrontmatterText, '(?m)^description:[ \t]*(?<value>.+?)\r?$')
if (-not $skillDescriptionMatch.Success) { throw 'missing Skill description' }
$skillDescription = $skillDescriptionMatch.Groups['value'].Value.Trim()
foreach ($fragment in @('SAGE-governed', 'adoption', 'planning', 'implementation', 'review', 'release', 'ordinary chat', 'projects that have not adopted SAGE-Kit')) {
    if ($skillDescription -notlike "*$fragment*") { throw "Skill description missing required scope or exclusion: $fragment" }
}
if ($skillFrontmatterText -notmatch '(?m)^disable-model-invocation:[ \t]*false[ \t]*\r?$') { throw 'Skill disable-model-invocation must be false' }
if ($skill -notmatch 'No CLI, package runtime, daemon, or hidden validator is required') { throw 'missing model-native architecture statement' }
if (($skill -replace '`', '') -notlike '*SAGE-Kit adoption does not depend on $sage-kit appearing in every prompt.*') { throw 'Skill automatic activation must not require explicit invocation per prompt' }

$agentManifest = Get-Content -LiteralPath 'skills/sage-kit/agents/openai.yaml' -Raw
$implicitInvocationEntries = @([regex]::Matches($agentManifest, '(?m)^[ \t]*allow_implicit_invocation:[ \t]*(?<value>[^ \t#\r\n]+)[ \t]*(?:#.*)?\r?$'))
if ($implicitInvocationEntries.Count -ne 1 -or $implicitInvocationEntries[0].Groups['value'].Value -cne 'true') { throw 'SAGE-Kit allow_implicit_invocation must be exactly true' }
if ($agentManifest -notmatch 'Apply SAGE-Kit automatically') { throw 'SAGE-Kit agent manifest is missing automatic activation guidance' }
if ($agentManifest -notmatch 'Explicit \$sage-kit invocation is an override or diagnostic') { throw 'SAGE-Kit agent manifest is missing explicit invocation override guidance' }

$kernelConcepts = @('Authority and scope', 'Claim-evidence congruence', 'Observed-fact ownership', 'Affected-only invalidation', 'Genuine blockers')
$bootstrapRequirements = @('\bSAGE_ACTIVE\b', '\bLight work\b', '\bStandard or Heavy\b', 'Explicit \$sage-kit\s+invocation remains an override or\s+diagnostic', 'fallback\s+only\s+on\s+hosts\s+with\s+neither\s+automatic\s+project\s+instructions\s+nor\s+implicit\s+Skill\s+invocation')
foreach ($path in @('AGENTS.md', 'docs/templates/AGENTS_SAGE_BOOTSTRAP_TEMPLATE.md')) {
    $bootstrap = Get-Content -LiteralPath $path -Raw
    $bootstrapRoutingText = $bootstrap -replace '`', ''
    if (@(Get-Content -LiteralPath $path).Count -gt 80) { throw "SAGE-Kit bootstrap exceeds 80 lines: $path" }
    foreach ($concept in $kernelConcepts) {
        if ($bootstrap -notlike "*$concept*") { throw "SAGE-Kit bootstrap missing kernel concept '$concept': $path" }
    }
    foreach ($requirement in $bootstrapRequirements) {
        if ($bootstrapRoutingText -notmatch $requirement) { throw "SAGE-Kit bootstrap missing activation routing guidance: $path" }
    }
}

foreach ($path in ($tracked | Where-Object { $_ -like '*.json' })) {
    Get-Content -LiteralPath $path -Raw | ConvertFrom-Json | Out-Null
}

# Task Dispatch v2 is legacy static compatibility, not default routing. Verify
# only that its policy binds the exact schema bytes it declares.
$dispatchRoot = 'contracts/task-dispatch-v2'
$dispatchPolicy = Get-Content -LiteralPath "$dispatchRoot/policy.json" -Raw | ConvertFrom-Json
if ($dispatchPolicy.scope -ne 'legacy-static-compatibility' -or $dispatchPolicy.selection -ne 'explicit-only') { throw 'Task Dispatch v2 must remain explicit legacy compatibility' }
$dispatchSchemas = @($dispatchPolicy.schema_files)
if ($dispatchSchemas.Count -ne 2 -or $dispatchSchemas -notcontains 'task.schema.json' -or $dispatchSchemas -notcontains 'evidence.schema.json') { throw 'Task Dispatch v2 schema inventory is missing or malformed' }
foreach ($schemaName in $dispatchSchemas) {
    $schemaPath = "$dispatchRoot/$schemaName"
    $digestProperty = $dispatchPolicy.schema_sha256.PSObject.Properties[$schemaName]
    if (-not $digestProperty -or $digestProperty.Value -notmatch '^[0-9a-fA-F]{64}$') { throw "Task Dispatch v2 digest is missing or malformed: $schemaName" }
    if (-not (Test-Path -LiteralPath $schemaPath -PathType Leaf)) { throw "Task Dispatch v2 schema is missing: $schemaName" }
    $actual = (Get-FileHash -LiteralPath $schemaPath -Algorithm SHA256).Hash.ToLowerInvariant()
    if ($actual -ne $digestProperty.Value.ToLowerInvariant()) { throw "Task Dispatch v2 digest mismatch: $schemaName" }
}

# Validate the active Graph manifest only. Legacy compatibility contracts are
# readable inventory but are not part of default adoption.
$graphManifestPath = 'contracts/graph/v1/contract.json'
$graphManifest = Get-Content -LiteralPath $graphManifestPath -Raw | ConvertFrom-Json
foreach ($entry in $graphManifest.resources.PSObject.Properties) {
    $resourcePath = Join-Path (Split-Path -Parent $graphManifestPath) $entry.Value.resource
    if (-not (Test-Path -LiteralPath $resourcePath -PathType Leaf)) { throw "missing Graph manifest resource: $resourcePath" }
    $declared = $entry.Value.canonical_sha256
    $actual = (Get-FileHash -LiteralPath $resourcePath -Algorithm SHA256).Hash.ToLowerInvariant()
    if ($declared -ne $actual) { throw "Graph manifest digest mismatch: $resourcePath" }
}

# Validate only the small explicit canonical-authority pointer manifest, not
# ordinary Markdown links. This is the single validation owner for
# docs/agent/CLAIM_EVIDENCE_TRUST.md#sage-trust-001.
$canonicalPointers = @(Get-Content -LiteralPath 'contracts/canonical-authority-pointers.txt' | Where-Object { $_.Trim() })
if (($canonicalPointers | Sort-Object -Unique).Count -ne $canonicalPointers.Count) { throw 'duplicate canonical authority pointer' }
$declaredPointers = @()
foreach ($path in ($tracked | Where-Object { $_ -like 'docs/*.md' -or $_ -like 'docs/*/*.md' -or $_ -like 'docs/*/*/*.md' })) {
    foreach ($line in (Get-Content -LiteralPath $path)) {
        if ($line -match '^<a id="([^"]+)"></a>$') { $declaredPointers += "$path#$($Matches[1])" }
    }
}
$pointerDelta = @(Compare-Object ($canonicalPointers | Sort-Object) ($declaredPointers | Sort-Object))
if ($pointerDelta.Count -ne 0) { throw "canonical authority pointer manifest mismatch:`n$($pointerDelta | Out-String)" }
foreach ($reference in $canonicalPointers) {
    $targetPath, $anchor = $reference -split '#', 2
    if (-not (Test-Path -LiteralPath $targetPath -PathType Leaf)) { throw "broken canonical pointer: $reference" }
    $targetText = Get-Content -LiteralPath $targetPath -Raw
    $anchorPattern = '<a\s+id=["'']' + [regex]::Escape($anchor) + '["'']\s*></a>'
    if ($targetText -notmatch $anchorPattern) { throw "missing canonical anchor: $reference" }
}

if ($env:SAGEKIT_DIFF_BASE) {
    git diff --check "$($env:SAGEKIT_DIFF_BASE)...HEAD"
    if ($LASTEXITCODE -ne 0) { throw 'PR-range git diff --check failed' }
} else {
    git diff --check
    if ($LASTEXITCODE -ne 0) { Write-Warning 'local git diff --check reported hygiene issues (non-blocking without SAGEKIT_DIFF_BASE)' }
}

Write-Output 'repository integrity: PASS'
