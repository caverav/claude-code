#!/usr/bin/env bash

# Check which CLIs are available and output context about multi-model support

codex_available="false"
gemini_available="false"

if command -v codex >/dev/null 2>&1; then
  codex_available="true"
fi

if command -v gemini >/dev/null 2>&1; then
  gemini_available="true"
fi

# Build the context message based on available CLIs
context="Multi-model CLI integration is enabled."

if [ "$codex_available" = "true" ] || [ "$gemini_available" = "true" ]; then
  context="$context The following external model CLIs are available:"
  if [ "$codex_available" = "true" ]; then
    context="$context OpenAI Codex CLI (use /multi-model-cli:codex to query)."
  fi
  if [ "$gemini_available" = "true" ]; then
    context="$context Google Gemini CLI (use /multi-model-cli:gemini to query)."
  fi
else
  context="$context No external model CLIs are currently installed. Use /multi-model-cli:setup to install and authenticate Codex CLI and/or Gemini CLI."
fi

# Output JSON with proper escaping using jq if available, otherwise use printf
# The context string is fully static/controlled so printf is safe as a fallback
if command -v jq >/dev/null 2>&1; then
  jq -n --arg ctx "$context" \
    '{"hookSpecificOutput":{"hookEventName":"SessionStart","additionalContext":$ctx}}'
else
  printf '{"hookSpecificOutput":{"hookEventName":"SessionStart","additionalContext":"%s"}}\n' "$context"
fi

exit 0
