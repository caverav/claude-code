---
description: Query OpenAI Codex CLI models from within Claude Code
allowed-tools: Bash(codex:*), Bash(command:*)
argument-hint: <prompt>
---

You are helping the user query the OpenAI Codex CLI from within Claude Code. The user's prompt will be passed to the Codex CLI.

## Prerequisites Check

1. Run `command -v codex` to verify the Codex CLI is installed.
2. If not installed, inform the user:
   ```
   Codex CLI is not installed. Run /multi-model-cli:setup codex to install and authenticate.
   ```
   Then stop.

## Send Query to Codex

1. Take the user's argument as the prompt.
2. Run the Codex CLI with the prompt:
   ```bash
   codex --quiet "$PROMPT"
   ```
   Where `$PROMPT` is the user's argument text.
3. If the Codex CLI returns an authentication error, inform the user:
   ```
   Codex CLI authentication required. Run /multi-model-cli:setup codex to authenticate.
   ```

## Present Results

1. Display the full response from the Codex CLI.
2. Format the output clearly, preserving any code blocks or structured content.
3. If the response contains code, wrap it in appropriate markdown code blocks.
4. Offer to apply any code suggestions from the Codex response to the current project if relevant.
