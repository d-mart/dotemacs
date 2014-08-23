;;;
;;; Configuration and mode customization lua
;;;

(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))

(add-hook 'lua-mode-hook 'my-programming-mode-hook)
