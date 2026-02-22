;; -*- lexical-binding: nil; -*-
;;;
;;; Configuration and mode customization
;;; common to all programming modes
;;;
(defun dm/programming-mode-hook ()
  (message "running dm/programming-mode-hook")
  (display-line-numbers-mode 1)
  (hl-line-mode 1)
  (sml-modeline-mode t)
  ;;; TODO (rainbow-delimiters-mode t)
  (fontify-at-todo)
  (highlight-numbers-mode))

(defun dm/programming-mode-keybindings ()
  (local-set-key (kbd "C-c C-c") 'dm/comment-or-uncomment-region))

(defun dm/eol-before-electric-newline (&rest _args)
  "Move to end of line before running `electric-newline-and-maybe-indent'."
  (end-of-line))

(advice-add 'electric-newline-and-maybe-indent :before #'dm/eol-before-electric-newline)
