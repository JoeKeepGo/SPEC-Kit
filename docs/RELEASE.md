# Releases

The first model-native SAGE-Kit release consists only of GitHub's generated
source archive. It does not claim an additional bundle, checksum artifact,
package, CLI, or executable framework runtime.

Release verification checks repository integrity, Skill metadata, every JSON
resource through `jq` or stock macOS `plutil`, optional host-hook tests, and
the forbidden shipped runtime, entrypoint, and executable-dependency inventory.
The release-resource inventory keeps direct claims limited to the license,
bilingual READMEs, migration/release guidance, host references, and shipped
Claude agent examples. Product checks remain the consumer project's
responsibility.

The `v*` tag trigger reruns the static checks and rejects a tag whose target is
not reachable from `main`. Published tags are immutable; a release correction
uses a new tag.
