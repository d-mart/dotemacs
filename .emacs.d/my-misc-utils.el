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

;; lifted from emacs.wordpress.com
(defun jao-copy-line (arg)
  "Copy line(s) to the kill ring"
  (interactive "p")
  (kill-ring-save (line-beginning-position)
                  (line-beginning-position (+ 1 arg)))
  (message "%d line%s copied" arg (if (= 1 arg) "" "s")))

;; The built-in (open-line) will split the middle of the line
;; and doesn't indent the line that is moved down.
(defun dm-open-line (arg)
  "open-line the right way"
  (interactive "p")
  (beginning-of-line)
  )

;; Occur across open buffers - TODO - make a wrapper for this
;; C-u M-x multi-occur-in-matching-buffers
;; - don't prompt for buffer (use regex '.*')
;; - prompt for occur regex

(defun ruby-class-to-file (prefix-arg-code)
  "Convert CamelCase word at point to camel_case. Optionally append '.rb'"
  (interactive "P")
  (save-restriction
    (select-current-word)
    (narrow-to-region (region-beginning) (region-end))
    (beginning-of-buffer)
    ;; set searches to be case-sensitive
    (let ((case-fold-search nil))
      ;; skip first captial letter
      (re-search-forward "[A-Z]")
      ;; look for capital letters - replace with underscore and lower
      (while (re-search-forward "\\([A-Z]\\)" nil t)
        (replace-match "_\\1" t nil))
      (downcase-region (point-min) (point-max)))))

(defun ruby-file-to-class (prefix-arg-code)
  "Convert some_file_name(.rb) to SomeFileName"
  (interactive "P")
  (save-restriction
    (select-current-word)
    (narrow-to-region  (region-beginning) (region-end))
    (capitalize-region (region-beginning) (region-end))
    (replace-string ".rb" "" nil (region-beginning) (region-end)) ;; TODO region doesn't include this (select current-word doesn't match '.')
    (replace-string "_" "" nil (region-beginning) (region-end))
    (end-of-buffer)))

(defun argument-test ()
  (interactive
   (cond
    ((equal current-prefix-arg nil)     ; universal-argument not called
     (list (message "No argument")))
    ((equal current-prefix-arg '(4))    ; C-u
     (message "C-u argument"))
    ((equal current-prefix-arg '(16))   ; C-u C-u
     (message "C-u C-u argument"))
    (t                                  ; C-u <n>
     (message "C-u %s argument" current-prefix-arg))
    )))

(defun show-prefix (arg)
  "Show the univeral (prefix) argument"
  (interactive "P")
  (message "Arg is %s" arg))

(defun blah ()
  (interactive)
  (setq x 5)
  (message "The value of x is %s" x)
  (let ((x 6))
    (message "The value of x is %s" x))
  (message "The value of x is %s" x))
