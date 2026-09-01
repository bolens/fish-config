# Fish Configuration Constitution

## Core Principles

### I. Fast, Reliable Interactive Startup
Shell startup MUST remain responsive and non-fatal when optional tools are missing. Expensive initialization is deferred or cached, and non-interactive shells are not polluted by interactive behavior.

### II. Fish-Native, Modular Configuration
Configuration MUST use Fish syntax and established `conf.d`, functions, completions, and plugin structure rather than Bash compatibility patterns or monolithic startup files.

### III. Optional Integrations Degrade Gracefully
Tool aliases, wrappers, prompts, and completions MUST check availability and MUST NOT shadow commands with incompatible behavior without clear intent.

### IV. Private State Is Separate
Host-specific values, secrets, tokens, and private configuration belong in ignored private files. Tracked defaults remain portable and safe to source.

### V. Syntax and Startup Verification
Changed Fish files MUST pass syntax checks and representative interactive/non-interactive startup tests where applicable. Live shell installation or replacement requires explicit authorization.

## Governance

The documented module structure is authoritative. Amendments require startup and portability impact review plus a version update.

**Version**: 1.0.0 | **Ratified**: 2026-08-15 | **Last Amended**: 2026-08-15
