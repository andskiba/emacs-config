# Emacs Configuration

This is a personal Emacs configuration (`~/.emacs.d`) for Andrzej Skiba.

## Architecture

The config is split across three directories loaded at startup:

- **`personal/`** — cross-language personal modules (theme, org, prog utilities)
  - `as-theme.el` — font selection (prefers "Dank Mono-16") and look & feel
  - `as-org.el` — org-mode keybindings and settings
  - `as-prog-utils.el` — shared helpers (e.g. `as/maybe-format-buffer` for eglot-managed buffers)
- **`languages/`** — one file per language, each `provide`d and `require`d from `init.el`
- **`external/`** — vendored packages (currently: `combobulate`, gitignored)
- **`init.el`** — entry point; loads both directories onto `load-path`, bootstraps all packages via `use-package`

## Key Conventions

**Adding a new language:** Create `languages/as-<lang>.el`, add `(require 'as-<lang>)` at the bottom of `init.el` alongside the others, and register any tree-sitter grammar in the `treesit` block at the top of `init.el`.

**LSP:** All language servers use **eglot** (built-in). Each language file calls `(eglot-ensure)` in a `:hook`. Auto-format on save is done via `as/maybe-format-buffer` (from `as-prog-utils.el`) hooked to `before-save`.

**Tree-sitter first:** Major modes are remapped to their `-ts-mode` equivalents in `init.el`. New languages should use `*-ts-mode` rather than legacy modes. Grammars are auto-installed if missing via `treesit-install-language-grammar`.

**Package management:** All packages use `:ensure t` via `use-package`. `custom.el` is the generated customization file (committed, managed by Emacs).

**Keybinding namespace:** Personal bindings use `C-c m <key>` as the prefix. Key-chord shortcuts (`jj`, `jl`, `jk`, etc.) are defined in `init.el` using `key-chord`.

**Completion stack:** vertico (minibuffer UI) + corfu (in-buffer) + consult (search/nav) + orderless (matching) + marginalia (annotations) + embark (actions).

**Mac-specific:** `mac-command-modifier` is remapped to `control` on Darwin.
