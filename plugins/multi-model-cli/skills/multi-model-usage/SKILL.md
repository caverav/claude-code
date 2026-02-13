---
name: multi-model-usage
description: |
  This skill should be used when the user wants to query external model CLIs (OpenAI Codex or Google Gemini) from within Claude Code, compare outputs across models, or set up multi-model workflows. Trigger phrases: "use codex", "ask gemini", "compare models", "multi-model", "codex CLI", "gemini CLI", "external model", "other model"
---

# Multi-Model CLI Usage

This skill provides guidance on using external model CLIs (OpenAI Codex CLI and Google Gemini CLI) from within Claude Code.

## Available Commands

- `/multi-model-cli:setup [codex|gemini|all]` — Install and authenticate with external CLIs
- `/multi-model-cli:codex <prompt>` — Send a prompt to the OpenAI Codex CLI
- `/multi-model-cli:gemini <prompt>` — Send a prompt to the Google Gemini CLI
- `/multi-model-cli:status` — Check installation and auth status of all CLIs

## Setup Flow

1. Run `/multi-model-cli:setup` to install and authenticate CLIs
2. The setup command will:
   - Check if the CLI tools are installed
   - Offer to install them via npm if missing
   - Guide you through OAuth login for each provider
   - Verify authentication was successful

## Authentication

Both CLIs use OAuth browser-based login flows. The exact auth commands may vary
by CLI version — the setup command will detect the correct commands for your
installed versions:

- **Codex CLI**: Typically uses `codex auth login` for OpenAI OAuth
- **Gemini CLI**: Typically uses `gemini auth login` for Google OAuth

Authentication tokens are stored locally by each CLI tool and persist across sessions.

## Usage Patterns

### Query a specific model
Use `/multi-model-cli:codex <your question>` or `/multi-model-cli:gemini <your question>` to get a response from the respective model.

### Compare model outputs
Ask Claude to run the same prompt through both CLIs and compare the results. For example:
1. Run `/multi-model-cli:codex "Explain this function"` 
2. Run `/multi-model-cli:gemini "Explain this function"`
3. Ask Claude to compare and synthesize the responses

### Use as a second opinion
When working on complex code, get a second opinion from another model by using the codex or gemini commands with the same context.

## Troubleshooting

- If a CLI is not found, run `/multi-model-cli:setup` to install it
- If authentication fails, try running the CLI auth command directly in your terminal
- Check `/multi-model-cli:status` to verify installation and authentication state
