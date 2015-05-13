;;;
;;; Configuration and mode customization
;;; common to all programming modes
;;;

(defun my-programming-mode-hook ()
  (linum-mode 1)
  (hlinum-activate)
  (hl-line-mode 1)
  ; giving smart-parens another shot (electric-pair-mode 1)
  (highlight-parentheses-mode 1)
  (fontify-at-todo)
  (highlight-numbers-mode)
  )

; (projectile-on)
