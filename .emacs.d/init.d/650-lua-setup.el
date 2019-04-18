;;;
;;; Configuration and mode customization lua
;;;

(defun dm/lua-mode-keykindings ()
  (define-key lua-mode-map (kbd "C-c C-c") 'comment-or-uncomment-region)
  (define-key lua-mode-map (kbd "C-c #")   'comment-or-uncomment-region))

(defun dm/lua-mode-hook ())

(add-hook 'lua-mode-hook 'dm/programming-mode-hook)
(add-hook 'lua-mode-hook 'dm/lua-mode-hook)
(add-hook 'lua-mode-hook 'dm/lua-mode-keykindings)

(setq lua-indent-level 2)

(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'auto-mode-alist '("\\.rockspec$" . lua-mode))
