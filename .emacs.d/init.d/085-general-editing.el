;; ----------------
;; General editing settings that apply anywhere
;; ----------------
(use-package zzz-to-char
  :init
  ()
  :bind
  (("M-z" . zzz-up-to-char)
   ("M-Z" . zzz-to-char)))

(setq cursor-type 'box)
