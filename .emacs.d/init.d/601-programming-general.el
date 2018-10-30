;;;
;;; Configuration and mode customization
;;; common to all programming modes
;;;
(defun my-programming-mode-hook ()
  (linum-mode 1)
  (hlinum-activate)
  (hl-line-mode 1)
  (sml-modeline-mode t)
  (rainbow-delimiters-mode t)
  (fontify-at-todo)
  (highlight-numbers-mode))

(defadvice electric-newline-and-maybe-indent (before eol-before-electric-newline ())
  "move to the end of the current line before inserting a new line before
   instead of breaking the current line"
  (end-of-line))

(ad-activate 'electric-newline-and-maybe-indent)
