<!-- markdownlint-disable MD013 -->

# AGENTS.md

## Build, Lint, and Test Commands

- **Build:** Use `just run` to run the flake (see README.md).

## Code Style Guidelines

- **Imports:** Organize imports using formatter/linter defaults (e.g., `ruff_organize_imports` for Python).
- **Formatting:** Use the configured formatters for each language. Run formatters on save or via keybindings (see formatters.lua).
- **Types:** Use static typing where supported (e.g., TypeScript, Python with type hints).
- **Naming:** Use descriptive, lower_snake_case or camelCase for variables/functions as per language norms.
- **Error Handling:** Prefer explicit error handling (try/catch, pcall, etc.) and avoid silent failures.
- **General:** Follow idiomatic style for each language. Keep code modular and readable. Use LSP, lint, and format on save for consistency.

## Notes

- No Cursor or Copilot rules found.
- For new languages or tools, extend linter/formatter configs in `lua/nyanvim/lsps/`.
- See README.md for more usage details.
