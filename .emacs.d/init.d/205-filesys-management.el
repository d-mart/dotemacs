; Prevent dired from spamming the minibuffer
(setq dired-omit-verbose nil)

(use-package fzf
  :bind
  (("C-h t" . fzf-git-files)
   ("C-h T" . fzf)))
