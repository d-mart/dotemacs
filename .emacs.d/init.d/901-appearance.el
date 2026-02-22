;; -*- lexical-binding: nil; -*-
(use-package doom-themes
  :ensure t
  :config
  (when (require 'doom-themes nil t)
    ;; Global settings (defaults)
    (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
          doom-themes-enable-italic t) ; if nil, italics is universally disabled

    ;; Enable flashing mode-line on errors
    (when (fboundp 'doom-themes-visual-bell-config)
      (doom-themes-visual-bell-config))
    ;; Enable custom neotree theme (all-the-icons must be installed!)
    (when (fboundp 'doom-themes-neotree-config)
      (doom-themes-neotree-config))
    ;; or for treemacs users
    (setq doom-themes-treemacs-theme "doom-atom") ; use "doom-colors" for less minimal icon theme
    (when (fboundp 'doom-themes-treemacs-config)
      (doom-themes-treemacs-config))
    ;; Corrects (and improves) org-mode's native fontification.
    (when (fboundp 'doom-themes-org-config)
      (doom-themes-org-config))))
