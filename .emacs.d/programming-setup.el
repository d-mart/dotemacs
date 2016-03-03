;;;
;;; Configuration and mode customization
;;; common to all programming modes
;;;

(defun my-programming-mode-hook ()
  (linum-mode 1)
  (hlinum-activate)
  (hl-line-mode 1)
  (rainbow-delimiters-mode t)
  (fontify-at-todo)
  (highlight-numbers-mode)
  )

; (projectile-on)
