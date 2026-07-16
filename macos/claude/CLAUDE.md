# Global Preferences

This file applies to every project on this machine. Keep it short — every line here
competes for attention with project-specific instructions, so only put things that are
true regardless of what I'm working on.

## Tooling defaults

- macOS. Use Homebrew for installing anything system-level — check for a Brewfile
  before suggesting a manual install.
- Prefer native, one-time-purchase tools over subscriptions or heavier frameworks
  when there's a reasonable choice.
- Shell is zsh. Dotfiles are managed with chezmoi — if a change touches ~/.zshrc,
  ~/.config, or similar, mention that it may need to be applied via chezmoi rather
  than edited directly.
- Don't suggest npm/pip installs with sudo. Point out the non-sudo fix instead.

## Working style

- Be direct. Skip the recap of what I asked for — just do it or explain why not.
- When you're not sure which approach I want, pick the most reasonable one, state
  the assumption in one line, and proceed. Don't stop to ask unless it's genuinely
  ambiguous or risky.
- Before changing or deleting an existing file, show me what's changing if it's
  not obvious from a diff.
- Prefer editing existing files over creating new ones unless a new file is clearly
  warranted.

## Code style

- Match whatever convention already exists in the file/project over any personal
  default — consistency with the codebase wins over "correctness" of style.
- No comments that just restate what the code does. Comment on *why*, not *what*.
- Keep functions small and named for what they do.

## Git

- Write commit messages in imperative mood ("Add x", not "Added x").
- Don't include "Co-authored-by" or AI-attribution trailers unless I ask.
- Never force-push without confirming first.
