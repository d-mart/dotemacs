;;;
;;; Configuration and mode customization lua
;;;
(add-hook 'lua-mode-hook 'my-programming-mode-hook)

(setq lua-indent-level 2)

(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'auto-mode-alist '("\\.rockspec$" . lua-mode))
