# Multi-Model CLI Integration Plugin

Integrate Claude Code with OpenAI Codex CLI and Google Gemini CLI models through their OAuth logins, enabling multi-model workflows from within Claude Code.

## What it does

This plugin adds commands to Claude Code that allow you to:

1. **Set up and authenticate** with Codex CLI and Gemini CLI using their OAuth flows
2. **Query Codex models** directly from Claude Code
3. **Query Gemini models** directly from Claude Code
4. **Check status** of CLI installations and authentication

## Commands

| Command | Description |
|---------|-------------|
| `/multi-model-cli:setup [codex\|gemini\|all]` | Install and authenticate with external CLIs |
| `/multi-model-cli:codex <prompt>` | Send a prompt to OpenAI Codex CLI |
| `/multi-model-cli:gemini <prompt>` | Send a prompt to Google Gemini CLI |
| `/multi-model-cli:status` | Check CLI installation and auth status |

## Prerequisites

- **Node.js**: Required for installing CLI tools via npm
- **Browser access**: Required for OAuth authentication flows

## Quick Start

1. Install the plugin in Claude Code
2. Run `/multi-model-cli:setup` to install and authenticate with the CLIs
3. Use `/multi-model-cli:codex <prompt>` or `/multi-model-cli:gemini <prompt>` to query models

## How Authentication Works

Both CLIs use browser-based OAuth login flows:

- **Codex CLI** (`codex auth login`): Opens a browser window for OpenAI OAuth authentication
- **Gemini CLI** (`gemini auth login`): Opens a browser window for Google OAuth authentication

Tokens are stored locally by each CLI tool and persist across Claude Code sessions.

## SessionStart Hook

The plugin includes a SessionStart hook that automatically detects which external
CLIs are installed and informs Claude about their availability at the start of
each session. This enables Claude to suggest using external models when
appropriate.

## Use Cases

### Get a second opinion
When working on complex code, query another model for a different perspective:
```
/multi-model-cli:codex "Review this function for potential bugs: <paste code>"
```

### Compare model outputs
Run the same prompt through multiple models and compare their responses to get
the best answer.

### Leverage model strengths
Different models may excel at different tasks. Use Codex for code generation
tasks and Gemini for reasoning or analysis tasks.

## Installation

Install from the claude-code marketplace:

```bash
/plugin install multi-model-cli@claude-code-marketplace
```

Or use directly for development:

```bash
cc --plugin-dir /path/to/multi-model-cli
```
