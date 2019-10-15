;;; Various advice functions

;; When using open-line, move to the beginning-of-line first
;; (i.e. don't split the current line)
(defadvice open-line (before my-open-line-before-advice activate)
  "Move to beginning of current line before opening a new line above"
  (beginning-of-line))
