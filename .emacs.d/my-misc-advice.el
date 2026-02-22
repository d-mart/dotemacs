;; -*- lexical-binding: nil; -*-
;;; Various advice functions

;; When using open-line, move to the beginning-of-line first
;; (i.e. don't split the current line)
(defun dm/open-line-before-advice (&rest _args)
  "Move to beginning of current line before opening a new line above."
  (beginning-of-line))

(advice-add 'open-line :before #'dm/open-line-before-advice)
