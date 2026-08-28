;; -*- lexical-binding: t; -*-
;; ------------------
;; Claude Code session embedded in Emacs
;;
;; claude-code-ide.el runs the `claude` CLI in a terminal buffer and also
;; speaks Claude's IDE protocol over MCP, so the session sees the active
;; buffer/selection, can read flymake+flycheck diagnostics, and routes its
;; edits through ediff for review before they land.
;;
;; Not on MELPA -- installed straight from GitHub via use-package :vc
;; (built in to Emacs 30+).
;; ------------------

;; Terminal host for the CLI's TUI. eat is pure elisp (NonGNU ELPA); vterm
;; would need cmake + libvterm built locally.
(use-package eat
  :defer t)

(use-package claude-code-ide
  :vc (:url "https://github.com/manzaltu/claude-code-ide.el" :rev :newest)
  :defer t
  :bind ("C-c v" . claude-code-ide-menu)
  :config
  (setq claude-code-ide-terminal-backend 'eat
        claude-code-ide-use-side-window t)
  ;; Hands Claude xref, imenu, treesit and project navigation as MCP tools
  (claude-code-ide-emacs-tools-setup))

;; Monaco (the NS build's default face font) ships Regular only -- no italic
;; face exists on disk, so Claude's emphasis renders upright. Menlo has real
;; Regular/Bold/Italic/BoldItalic. Remap the whole terminal buffer rather than
;; just the italic face: one family keeps the character grid self-consistent.
(defun dm/eat-use-italic-capable-font ()
  (face-remap-add-relative 'default :family "Menlo"))

(add-hook 'eat-mode-hook #'dm/eat-use-italic-capable-font)
