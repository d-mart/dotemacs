;; ------------------
;; Markdown and related setup
;; ------------------
(use-package markdown-mode
  :ensure t
  :demand markdown-edit-indirect
  :mode (("\\.md" . markdown-mode)
         ("\\.markdown" . markdown-mode))
  :bind (:markdown-mode-map
         ("C-c '" . markdown-edit-indirect)))
