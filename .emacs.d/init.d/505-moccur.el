;; ripped from README.md

(use-package color-moccur
  :commands (isearch-moccur isearch-all)
  :bind ("M-s O" . moccur)
  :init
  (bind-key "M-o" 'isearch-moccur isearch-mode-map)
  (bind-key "M-O" 'isearch-moccur-all isearch-mode-map)
  :config
  (use-package moccur-edit))
