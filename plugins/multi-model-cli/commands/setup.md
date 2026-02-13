---
description: Set up and authenticate with Codex CLI and/or Gemini CLI for multi-model usage
allowed-tools: Bash(which:*), Bash(codex:*), Bash(gemini:*), Bash(npm:*), Bash(pip:*), Bash(npx:*), Bash(command:*)
argument-hint: "[codex|gemini|all]"
---

You are helping the user set up external CLI tools for multi-model integration. Based on the argument provided, set up one or both of the following CLI tools.

## Step 1: Determine which CLIs to set up

- If the argument is "codex", set up only the OpenAI Codex CLI.
- If the argument is "gemini", set up only the Google Gemini CLI.
- If the argument is "all" or no argument is provided, set up both.

## Step 2: Check prerequisites

For each CLI to set up, check if the tool is already installed:

### Codex CLI
1. Run `command -v codex` to check if the Codex CLI is installed.
2. If not installed, inform the user:
   ```
   The OpenAI Codex CLI is not installed. Install it with:
     npm install -g @openai/codex
   ```
3. Ask the user if they want you to install it now.
4. If installed, check the version with `codex --version`.

### Gemini CLI
1. Run `command -v gemini` to check if the Gemini CLI is installed.
2. If not installed, inform the user:
   ```
   The Google Gemini CLI is not installed. Install it with:
     npm install -g @anthropic-ai/gemini-cli
   or:
     pip install google-gemini-cli
   ```
3. Ask the user if they want you to install it now.
4. If installed, check the version with `gemini --version`.

## Step 3: Authenticate

For each installed CLI, guide the user through OAuth authentication:

### Codex CLI OAuth Login
1. Inform the user: "Starting Codex CLI OAuth login. This will open a browser window for authentication."
2. Run `codex auth login` to initiate the OAuth flow.
3. Wait for the user to complete the browser-based authentication.
4. Verify authentication with `codex auth status` or `codex auth whoami`.

### Gemini CLI OAuth Login
1. Inform the user: "Starting Gemini CLI OAuth login. This will open a browser window for authentication."
2. Run `gemini auth login` to initiate the OAuth flow.
3. Wait for the user to complete the browser-based authentication.
4. Verify authentication with `gemini auth status`.

## Step 4: Confirm setup

Report the status of each CLI:
- Whether it is installed and which version
- Whether authentication was successful
- Available models (if the CLI supports listing models)

Provide a summary like:
```
✅ Multi-Model CLI Setup Complete

Codex CLI: Installed (v1.x.x) - Authenticated as <user>
Gemini CLI: Installed (v1.x.x) - Authenticated as <user>

Use /multi-model-cli:codex to query Codex models
Use /multi-model-cli:gemini to query Gemini models
Use /multi-model-cli:status to check authentication status
```
