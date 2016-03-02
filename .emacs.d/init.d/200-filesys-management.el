(use-package sunrise-commander
  :bind
  (("C-x d"   . sunrise)
   ("C-x C-d" . sunrise-cd)))

; Prevent dired from spamming the minibuffer
(setq dired-omit-verbose nil)
