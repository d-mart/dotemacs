;; ----------------
;; General editing settings that apply anywhere
;; ----------------
(use-package avy-zap
  :init
  ()
  :bind
  (("M-z" . avy-zap-to-char-dwim)
   ("M-Z" . avy-zap-up-to-char-dwim)))
