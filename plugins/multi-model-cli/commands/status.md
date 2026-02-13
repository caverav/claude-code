---
description: Check installation and authentication status of Codex CLI and Gemini CLI
allowed-tools: Bash(codex:*), Bash(gemini:*), Bash(command:*), Bash(which:*)
---

You are checking the installation and authentication status of the external model CLIs.

## Check Codex CLI

1. Run `command -v codex` to check if the Codex CLI is installed.
2. If installed:
   - Run `codex --version` to get the version.
   - Run `codex auth status` or `codex auth whoami` to check authentication status.
3. If not installed, note it as "Not installed".

## Check Gemini CLI

1. Run `command -v gemini` to check if the Gemini CLI is installed.
2. If installed:
   - Run `gemini --version` to get the version.
   - Run `gemini auth status` to check authentication status.
3. If not installed, note it as "Not installed".

## Report Status

Present a clear status summary:

```
Multi-Model CLI Status
━━━━━━━━━━━━━━━━━━━━━

Codex CLI:  [Installed vX.X.X | Not installed]
  Auth:     [Authenticated as <user> | Not authenticated | N/A]

Gemini CLI: [Installed vX.X.X | Not installed]
  Auth:     [Authenticated as <user> | Not authenticated | N/A]
```

If any CLI is not installed or not authenticated, suggest the appropriate setup command:
- `/multi-model-cli:setup codex` for Codex
- `/multi-model-cli:setup gemini` for Gemini
- `/multi-model-cli:setup all` for both
