# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Is

Personal Emacs configuration repository. All configuration lives under `.emacs.d/`.

## Architecture

### Loading System

Entry point is `.emacs.d/init.el`, which:
1. Sets up package management (ELPA + MELPA) with `use-package` (`:ensure t` globally enabled)
2. Loads utility files directly: `misc-utils.el`, `my-misc-utils.el`, `my-misc-advice.el`, `faces-setup.el`, `ediff-setup.el`, `irc-setup.el`
3. Auto-loads all `.el` files from `init.d/` matching `^[^_].*.el$` (alphabetical order)
4. Auto-loads all `.el` files from `local-init.d/` (machine-specific overrides)
5. Loads `host-overrides.el` last (git-ignored, per-machine settings)

**Prefix an init.d file with underscore (`_`) to skip loading it.**

### init.d File Convention

Files are named `NNN-description.el` where the 3-digit prefix controls load order:

- **0xx**: OS/performance/environment (`040-os-settings`, `041-performance-tuning`, `070-general-env`, `071-faces-text-fonts`)
- **0xx-1xx**: UI, navigation, keybindings (`085-general-editing`, `100-ibuffer`, `150-general-keybindings`, `175-layout`)
- **2xx-3xx**: File management and shells (`200-dired`, `300-eshell-setup`)
- **4xx-5xx**: Editing tools (`500-smartparens`, `510-multiple-cursors`, `550-helm`)
- **6xx**: Programming languages and tools - most use prefix `650-` (`650-python-setup`, `650-git-setup`, `650-rust-setup`, etc.), plus `601-programming-general`, `605-org-mode`
- **7xx**: Features (`700-navigation`, `715-version-control`, `770-ai-assistant-setup`)
- **9xx**: Final appearance/debug (`901-appearance`, `999-diminish`)

### Key Patterns

- **Custom functions use `dm/` prefix**: e.g., `dm/select-current-line`, `dm/programming-mode-hook`
- **Programming mode setup**: `601-programming-general.el` defines `dm/programming-mode-hook` (line numbers, hl-line, fontify TODO/FIXME) which individual language files hook into
- **Language files** follow the pattern: define mode-specific keybindings in a function, add both `dm/programming-mode-hook` and language-specific hooks
- **use-package** is the standard for package configuration; use `:defer t` for lazy loading
- **Registers**: `C-x r j e` jumps to init.el, `C-x r j o` to misc.org
- **`safe-wrap` macro**: defined in init.el for error-handling around risky init code
- **Command aliases**: defined at the end of init.el (e.g., `gf` for grep-find, `ar` for align-regexp, `cr` for comment-or-uncomment-region)

### Machine-Specific Configuration

- `host-overrides.el` - git-ignored file loaded last; use for paths, fonts, org directories
- `local-init.d/` - additional numbered files that load after `init.d/`; use for machine-specific modes or overrides

## Working With This Config

- **Elisp syntax**: all config files are Emacs Lisp (`.el`)
- **Byte-compile**: `C-u 0 M-x byte-recompile-directory` to compile all `.el` files
- **Testing changes**: evaluate individual expressions with `C-x C-e` or reload a file with `M-x load-file`
- **Adding a new language**: create `.emacs.d/init.d/650-<language>-setup.el`, use `use-package`, hook into `dm/programming-mode-hook`
- **Disabling a config module**: prefix its filename with `_` (e.g., rename to `_650-clojure-setup.el`)
