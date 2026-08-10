# Migrating To The Model-Native Release Line

This release line removes the former executable package and command surface.
Existing tags remain immutable and continue to document their historical
behavior. Do not rewrite accepted project history to imitate the new model.

## Remove From Consumer Automation

- package installation and imports;
- command wrappers and command-specific configuration;
- candidate freezing, repository-wide artifact hashing, and framework
  checkpoints;
- framework process/resource management and leases;
- wheel build, install, and package smoke jobs;
- framework runtime store, recovery, and resolver calls.

## Keep Or Adopt

- project-owned current authority and active SPEC;
- compact `ACTIVE_CONTEXT` handoff truth;
- milestone, wave, phase, and lane planning at the depth the product needs;
- project-native focused checks and CI;
- static contracts from `contracts/` where they add value;
- the optional Skill for model routing and host-specific guidance.

Replace former runtime calls with a direct model workflow: read authority and
SPEC, plan, edit, run project checks, review by risk, run required final CI once
per unchanged candidate, and
return evidence to the human acceptance owner.

Legacy runtime compatibility belongs to the old immutable release tag. The new
line intentionally ships no compatibility executable.

## Migrate From Explicit-Only Activation

The model-native line no longer requires `$sage-kit` in every prompt:

1. Install or reference the Skill once through the host's normal Skill
   mechanism.
2. Preflight the host version and configuration against its documented
   automatic instruction and Skill-discovery behavior. Then add the lightweight
   project entry from
   [`AGENTS_SAGE_BOOTSTRAP_TEMPLATE.md`](templates/AGENTS_SAGE_BOOTSTRAP_TEMPLATE.md)
   using the host's documented automatic instruction file. Claude Code uses a
   `CLAUDE.md` project instruction and may import the `AGENTS.md` bootstrap.
3. Let the project entry carry Light work, including Light review and
   mechanical corrective work. Load the complete Skill for materially semantic
   review or corrective work, Standard or Heavy work, and all acceptance or
   release work.
4. Keep explicit invocation as an override and diagnostic. Require it as the
   fallback whenever adoption, current authority, or required Skill content
   cannot be observed or resolved after preflight.

After activation, the first progress update reports the non-persistent
`SAGE_ACTIVE` routing marker. It is not execution, safety, permission, or
compliance proof and is not written to project documents, memory, receipts, or
ledgers. This migration adds no CLI, script, hook, validator, scheduler,
daemon, or framework runtime.
