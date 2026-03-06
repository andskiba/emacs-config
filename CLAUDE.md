# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a personal Emacs configuration using `use-package` for package management. Packages are installed from MELPA.

## Directory Structure

- `init.el` — Main entry point; loads all packages and requires all custom modules
- `personal/` — Personal modules on the load path: `as-theme.el` (fonts/theme), `as-org.el` (org-mode), `as-prog-utils.el` (shared helpers)
- `languages/` — Per-language modules on the load path, one file per language (e.g. `as-rust.el`, `as-elixir.el`)
- `external/combobulate/` — Tree-sitter structural editing package cloned as a git submodule, loaded via `:load-path`
- `elpa/` — Package installations managed by `package.el` (do not edit manually)
- `custom.el` — Auto-generated customization file (do not edit manually; tracked in git but modified by Emacs)

## Architecture Patterns

**Adding a new language:** Create `languages/as-<lang>.el`, add `(require 'as-<lang>)` to `init.el`, and configure with `use-package`. See existing language files for the pattern — most hook `eglot-ensure` for LSP and `as/maybe-format-buffer` on `before-save`.

**Module convention:** All custom modules use `(provide 'as-<name>)` at the end and are named with the `as/` function prefix or `as-` variable prefix.

**LSP:** Uses built-in `eglot`. LSP server paths are configured in the language files (e.g., `elixir-ls` at `~/software/elixir-ls/language_server.sh`, `clojure-lsp` at `/usr/local/bin/clojure-lsp`).

**Tree-sitter:** Built-in `treesit` with grammars auto-installed on startup. Old major modes are remapped to `-ts-mode` variants via `major-mode-remap-alist` in `init.el`.

**Completion stack:** Corfu (in-buffer) + Vertico (minibuffer) + Orderless (matching) + Consult (search/navigation) + Marginalia (annotations) + Embark (actions).

## Key Bindings Defined

| Key | Command |
|-----|---------|
| `C-x g` | `magit-status` |
| `C-c m SPC` | `fixup-whitespace` |
| `C-c m d` | `duplicate-line` |
| `C-c o` | Combobulate prefix |
| `C-.` / `C-;` | `embark-act` / `embark-dwim` |
| `jj` / `jl` / `jk` (key-chord) | `avy-goto-word-1` / line / char |
| `uu` (key-chord) | `undo-tree-visualize` |
| Elixir: `C-c m e .` | `exunit-verify-single` |
| Elixir: `C-c m e b/a/l` | exunit verify/all/rerun |
