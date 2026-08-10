$ErrorActionPreference = 'Stop'

$repoRoot = Split-Path -Parent $PSScriptRoot
$skillRoot = Join-Path $repoRoot 'skills/sage-kit'
$manifestPath = Join-Path $skillRoot 'skill-manifest.json'

function Assert-True {
    param([bool]$Condition, [string]$Message)
    if (-not $Condition) { throw $Message }
}

function Get-CanonicalTextSha256 {
    param([string]$Path)
    $utf8 = [System.Text.UTF8Encoding]::new($false)
    $text = [IO.File]::ReadAllText($Path, $utf8).Replace("`r`n", "`n")
    $sha256 = [System.Security.Cryptography.SHA256]::Create()
    try {
        return ([BitConverter]::ToString($sha256.ComputeHash($utf8.GetBytes($text)))).Replace('-', '').ToLowerInvariant()
    }
    finally {
        $sha256.Dispose()
    }
}

$expectedResources = @(
    'contracts/graph/v1/contract.json',
    'contracts/graph/v1/graph.schema.json',
    'contracts/graph/v1/node-result.schema.json',
    'docs/SAGE_CORE.md',
    'docs/agent/AGENT_HARNESS.md',
    'docs/agent/CLAIM_EVIDENCE_TRUST.md',
    'docs/agent/EXECUTION_ECONOMY.md',
    'docs/agent/GOVERNANCE_LEVELS.md',
    'docs/agent/SESSION_ORCHESTRATION.md',
    'docs/templates/AGENTS_SAGE_BOOTSTRAP_TEMPLATE.md'
)

Assert-True (Test-Path -LiteralPath $manifestPath -PathType Leaf) 'missing package identity manifest'
$manifest = Get-Content -LiteralPath $manifestPath -Raw | ConvertFrom-Json
Assert-True ($manifest.format_version -eq 1) 'unexpected manifest format version'
Assert-True ($manifest.package_id -ceq 'sage-kit') 'unexpected package id'
Assert-True ($manifest.package_version -cmatch '^\d{4}\.\d{1,2}\.\d{1,2}\.\d+$') 'invalid package version'
Assert-True ($manifest.release_identity -ceq "v$($manifest.package_version)") 'release identity does not match package version'
Assert-True ($manifest.locator.digest_algorithm -ceq 'sha256-utf8-canonical-lf') 'unexpected resource digest algorithm'

$entries = @($manifest.resources)
$logicalPaths = @($entries | ForEach-Object { $_.logical_path })
Assert-True ($entries.Count -eq $expectedResources.Count) 'unexpected packaged resource count'
Assert-True ((Compare-Object ($expectedResources | Sort-Object) ($logicalPaths | Sort-Object)).Count -eq 0) 'packaged resource inventory mismatch'
Assert-True (($logicalPaths | Sort-Object -Unique).Count -eq $logicalPaths.Count) 'duplicate logical resource path'
Assert-True ($logicalPaths -notcontains 'skill-manifest.json') 'manifest must not hash itself'
$manifestText = Get-Content -LiteralPath $manifestPath -Raw
Assert-True ($manifestText -notmatch '"(?:git_commit|source_root|checkout_path)"\s*:') 'manifest contains non-portable or self-referential provenance'

$packageEntries = @($manifest.package_files)
$actualPackagePaths = @(Get-ChildItem -LiteralPath $skillRoot -Recurse -File | Where-Object { $_.FullName -ne $manifestPath } | ForEach-Object {
    $_.FullName.Substring($skillRoot.Length + 1).Replace([IO.Path]::DirectorySeparatorChar, '/')
})
$manifestPackagePaths = @($packageEntries | ForEach-Object { $_.package_path })
Assert-True ($packageEntries.Count -gt 0) 'package file inventory is missing'
Assert-True (($manifestPackagePaths | Sort-Object -Unique).Count -eq $manifestPackagePaths.Count) 'duplicate package file inventory path'
Assert-True ((Compare-Object ($actualPackagePaths | Sort-Object) ($manifestPackagePaths | Sort-Object)).Count -eq 0) 'package file inventory does not exactly match the Skill directory'
$packageEntriesByPath = @{}
foreach ($entry in $packageEntries) {
    Assert-True ($entry.package_path -notmatch '(^|/)\.\.(/|$)') "package file path escapes package: $($entry.package_path)"
    Assert-True ($entry.package_path -cne 'skill-manifest.json') 'manifest must not inventory itself'
    Assert-True ($entry.sha256 -cmatch '^[0-9a-f]{64}$') "invalid package file digest: $($entry.package_path)"
    $packageFile = Join-Path $skillRoot ($entry.package_path -replace '/', [IO.Path]::DirectorySeparatorChar)
    Assert-True ((Get-CanonicalTextSha256 $packageFile) -ceq $entry.sha256) "package file digest mismatch: $($entry.package_path)"
    $packageEntriesByPath[$entry.package_path] = $entry
}

foreach ($entry in $entries) {
    Assert-True ($entry.logical_path -notmatch '(^|/)\.\.(/|$)') "logical path escapes package: $($entry.logical_path)"
    Assert-True ($entry.package_path -match '^references/framework/') "resource is not package-local: $($entry.logical_path)"
    Assert-True ($entry.package_path -notmatch '(^|/)\.\.(/|$)') "package path escapes package: $($entry.package_path)"
    Assert-True ($entry.sha256 -cmatch '^[0-9a-f]{64}$') "invalid resource digest: $($entry.logical_path)"

    $packagedPath = Join-Path $skillRoot ($entry.package_path -replace '/', [IO.Path]::DirectorySeparatorChar)
    $canonicalPath = Join-Path $repoRoot ($entry.logical_path -replace '/', [IO.Path]::DirectorySeparatorChar)
    Assert-True (Test-Path -LiteralPath $packagedPath -PathType Leaf) "missing packaged resource: $($entry.logical_path)"
    Assert-True (Test-Path -LiteralPath $canonicalPath -PathType Leaf) "missing canonical source: $($entry.logical_path)"
    $packagedDigest = Get-CanonicalTextSha256 $packagedPath
    $canonicalDigest = Get-CanonicalTextSha256 $canonicalPath
    Assert-True ($packagedDigest -ceq $entry.sha256) "manifest digest mismatch: $($entry.logical_path)"
    Assert-True ($canonicalDigest -ceq $entry.sha256) "packaged resource differs from canonical source: $($entry.logical_path)"
    Assert-True ($packageEntriesByPath.ContainsKey($entry.package_path)) "resource is absent from package file inventory: $($entry.logical_path)"
    Assert-True ($packageEntriesByPath[$entry.package_path].sha256 -ceq $entry.sha256) "resource and package file digests disagree: $($entry.logical_path)"
}

$resourcesByLogicalPath = @{}
foreach ($entry in $entries) { $resourcesByLogicalPath[$entry.logical_path] = $entry }
foreach ($packageEntry in ($packageEntries | Where-Object { $_.package_path.EndsWith('.md', [StringComparison]::Ordinal) })) {
    $markdownPath = Join-Path $skillRoot ($packageEntry.package_path -replace '/', [IO.Path]::DirectorySeparatorChar)
    $content = Get-Content -LiteralPath $markdownPath -Raw
    $allLocatorStarts = @([regex]::Matches($content, 'framework-doc\('))
    $locators = @([regex]::Matches($content, 'framework-doc\("(?<locator>[^"\r\n]+)"\)'))
    Assert-True ($allLocatorStarts.Count -eq $locators.Count) "malformed framework-doc locator: $($packageEntry.package_path)"
    foreach ($locatorMatch in $locators) {
        $locator = $locatorMatch.Groups['locator'].Value
        $parts = $locator -split '#', 2
        $logicalPath = $parts[0]
        $anchor = if ($parts.Count -eq 2) { $parts[1] } else { '' }
        Assert-True ($logicalPath -cmatch '^[A-Za-z0-9._-]+(?:/[A-Za-z0-9._-]+)+$') "malformed framework-doc path: $locator"
        Assert-True (-not $anchor -or $anchor -cmatch '^[A-Za-z0-9._-]+$') "malformed framework-doc anchor: $locator"
        Assert-True ($resourcesByLogicalPath.ContainsKey($logicalPath)) "framework-doc locator is absent from manifest: $locator"
        $resource = $resourcesByLogicalPath[$logicalPath]
        $targetPath = Join-Path $skillRoot ($resource.package_path -replace '/', [IO.Path]::DirectorySeparatorChar)
        Assert-True (Test-Path -LiteralPath $targetPath -PathType Leaf) "framework-doc target is missing: $locator"
        if ($anchor) {
            $targetContent = Get-Content -LiteralPath $targetPath -Raw
            Assert-True ($targetContent.Contains("<a id=`"$anchor`"></a>")) "framework-doc anchor is missing: $locator"
        }
    }
}

$bootstrapResource = $resourcesByLogicalPath['docs/templates/AGENTS_SAGE_BOOTSTRAP_TEMPLATE.md']
Assert-True ($null -ne $bootstrapResource) 'bootstrap template is absent from manifest'
$bootstrapContent = Get-Content -LiteralPath (Join-Path $skillRoot ($bootstrapResource.package_path -replace '/', [IO.Path]::DirectorySeparatorChar)) -Raw
Assert-True ($bootstrapContent -match 'package identity\s+and selected\s+resource\s+digest') 'bootstrap handoff omits package identity or selected resource digest'
Assert-True ($bootstrapContent -match 'never the activation marker') 'bootstrap handoff does not prohibit activation-marker propagation'

# Only manifest-owned canonical Markdown participates in package closure.
# Project-owned links and SKILL.md links explicitly marked source-archive-only
# remain outside this set and are not promoted into required package content.
$frameworkRoot = [IO.Path]::GetFullPath((Join-Path $skillRoot 'references/framework'))
$packageEntriesByPath = @{}
foreach ($entry in $entries) {
    $fullPath = [IO.Path]::GetFullPath((Join-Path $skillRoot ($entry.package_path -replace '/', [IO.Path]::DirectorySeparatorChar)))
    $packageEntriesByPath[$fullPath] = $entry
}
foreach ($entry in ($entries | Where-Object { $_.logical_path.EndsWith('.md', [StringComparison]::Ordinal) })) {
    $sourcePath = [IO.Path]::GetFullPath((Join-Path $skillRoot ($entry.package_path -replace '/', [IO.Path]::DirectorySeparatorChar)))
    $content = Get-Content -LiteralPath $sourcePath -Raw
    foreach ($match in [regex]::Matches($content, '!?(?:\[[^\]]*\])\((?<target>[^)]+)\)')) {
        $target = $match.Groups['target'].Value
        if ($target -match '^(?:https?|mailto):' -or $target.StartsWith('/')) { continue }
        if ($target.StartsWith('#')) {
            $targetPath = $sourcePath
            $anchor = $target.Substring(1)
        }
        else {
            $parts = $target -split '#', 2
            $targetPath = [IO.Path]::GetFullPath((Join-Path (Split-Path -Parent $sourcePath) ($parts[0] -replace '/', [IO.Path]::DirectorySeparatorChar)))
            $anchor = if ($parts.Count -eq 2) { $parts[1] } else { '' }
        }
        Assert-True ($targetPath.StartsWith($frameworkRoot, [StringComparison]::OrdinalIgnoreCase)) "packaged Markdown link escapes framework resources: $($entry.logical_path) -> $target"
        Assert-True ($packageEntriesByPath.ContainsKey($targetPath)) "packaged Markdown link target is absent from manifest: $($entry.logical_path) -> $target"
        Assert-True (Test-Path -LiteralPath $targetPath -PathType Leaf) "broken packaged Markdown link: $($entry.logical_path) -> $target"
        if ($anchor) {
            $targetContent = Get-Content -LiteralPath $targetPath -Raw
            Assert-True ($targetContent.Contains("<a id=`"$anchor`"></a>")) "missing packaged Markdown anchor: $($entry.logical_path) -> $target"
        }
    }
}

$locatorFiles = @(
    'SKILL.md',
    'references/adoption.md',
    'references/planning.md',
    'references/execution.md',
    'references/review-completion.md'
)
$locatorText = ($locatorFiles | ForEach-Object { Get-Content -LiteralPath (Join-Path $skillRoot $_) -Raw }) -join "`n"
Assert-True ($locatorText -notmatch '(?:\.\./){2,}docs/') 'required Skill reference still resolves outside the package'
Assert-True ($locatorText.Contains('skill-manifest.json')) 'Skill does not name its package identity manifest'
Assert-True ($locatorText.Contains('references/framework/contracts/graph/v1/')) 'Graph routing does not use the packaged contract'
Assert-True ($locatorText -match 'package identity\s+and selected\s+resource digest') 'descendant handoff does not bind portable references'

$changedSurface = Get-Content -LiteralPath (Join-Path $skillRoot 'SKILL.md') -Raw
Assert-True ($changedSurface -notmatch '[A-Za-z]:\\') 'Skill contains a hardcoded Windows path'
Assert-True ($changedSurface -notmatch '/(?:Users|home)/') 'Skill contains a hardcoded host path'

Write-Output "portable Skill references: $($entries.Count) resources, $($packageEntries.Count) package files, and Markdown closure verified"
