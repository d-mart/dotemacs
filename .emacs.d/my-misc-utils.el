(defun select-current-line ()
  "Set the region to the entire current line"
  (interactive)
  (transient-mark-mode 1)
  (end-of-line)
  (set-mark (line-beginning-position)))

(defun select-another-line ()
  "Move the mark to the end of the next line"
  (interactive)
  (forward-line 1)
  (end-of-line))

(defun select-current-word ()
  "Set the region to the current word"
  (interactive)
  (transient-mark-mode 1)
  (let (pt)
    (skip-chars-backward "-_A-Za-z0-9")
    (setq pt (point))
    (skip-chars-forward "-_A-Za-z0-9")
    (set-mark pt)))

(defun iwb ()
  ;; from http://emacsblog.org/2007/01/17/indent-whole-buffer/
  "indent whole buffer"
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil)
  (untabify (point-min) (point-max)))
