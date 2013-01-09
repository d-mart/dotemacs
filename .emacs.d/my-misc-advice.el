;;; Various advice functions that haven't a home elsewhere


;; When using zap-to char, don't delete the actual target char.
;; I.e. make zap-to-char be zap-up-to-char
(defadvice zap-to-char (after my-zap-to-char-advice (arg char) activate)
  "Kill up to the ARG'th occurence of CHAR, and leave CHAR. If
  you are deleting forward, the CHAR is replaced and the point is
  put before CHAR"
  (insert char)
  (if (< 0 arg) (forward-char -1)))

;; When using zap-to char, don't delete the actual target char.
;; I.e. make zap-to-char be zap-up-to-char
(defadvice icicle-zap-to-char (after my-zap-to-char-advice (arg char) activate)
  "Kill up to the ARG'th occurence of CHAR, and leave CHAR. If
  you are deleting forward, the CHAR is replaced and the point is
  put before CHAR"
  (insert char)
  (if (< 0 arg) (forward-char -1)))
