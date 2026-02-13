---
description: Query Google Gemini CLI models from within Claude Code
allowed-tools: Bash(gemini:*), Bash(command:*)
argument-hint: <prompt>
---

You are helping the user query the Google Gemini CLI from within Claude Code. The user's prompt will be passed to the Gemini CLI.

## Prerequisites Check

1. Run `command -v gemini` to verify the Gemini CLI is installed.
2. If not installed, inform the user:
   ```
   Gemini CLI is not installed. Run /multi-model-cli:setup gemini to install and authenticate.
   ```
   Then stop.

## Send Query to Gemini

1. Take the user's argument as the prompt.
2. Run the Gemini CLI with the prompt:
   ```bash
   gemini --quiet "$PROMPT"
   ```
   Where `$PROMPT` is the user's argument text.
3. If the Gemini CLI returns an authentication error, inform the user:
   ```
   Gemini CLI authentication required. Run /multi-model-cli:setup gemini to authenticate.
   ```

## Present Results

1. Display the full response from the Gemini CLI.
2. Format the output clearly, preserving any code blocks or structured content.
3. If the response contains code, wrap it in appropriate markdown code blocks.
4. Offer to apply any code suggestions from the Gemini response to the current project if relevant.
