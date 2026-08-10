# Releases

The model-native SAGE-Kit release consists only of GitHub's generated source
archive. It does not claim an additional bundle, checksum artifact, package
runtime, CLI, or executable framework runtime. Within that archive,
`skills/sage-kit` is a self-contained installable Skill directory for required
routing references. Its `skill-manifest.json` binds the package/release identity
and package-local canonical resources with cross-platform canonical-LF SHA-256
digests; a source checkout is optional deep-reading material and may substitute
for a packaged reference only when the selected resource digest matches.

Release verification checks repository integrity, Skill metadata, the Skill
manifest and its recursive package-local Markdown link/anchor closure, every
JSON resource through `jq` or stock macOS `plutil`, optional host-hook tests,
and the forbidden shipped runtime, entrypoint, and executable-dependency
inventory. The release-resource inventory keeps direct claims limited to the
license, bilingual READMEs, migration/release guidance, the Skill manifest,
host references, and shipped Claude agent examples. Product checks remain the
consumer project's responsibility.

The `v*` tag trigger reruns the static checks and rejects a tag whose target is
not reachable from `main`. Published tags are immutable; a release correction
uses a new tag.
