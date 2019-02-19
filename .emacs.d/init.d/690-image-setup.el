;;;
;;; Configuration and mode customization for
;;; image mode etc
;;;

(defun dm/image-mode-keybindings ()
  (define-key image-mode-map (kbd "g") 'revert-buffer-no-confirm))

(add-hook 'image-mode-hook 'dm/image-mode-keybindings)
