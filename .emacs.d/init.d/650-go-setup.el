;;; ----------------------
;;; Go
;;; ----------------------

(add-to-list 'auto-mode-alist '("\\.go$" . go-mode))

(defun dm/go-mode-keybindings ()
  (define-key go-mode-map (kbd "C-c C-c") 'comment-or-uncomment-region)
  (define-key go-mode-map (kbd "C-c #")   'comment-or-uncomment-region))

(add-hook 'go-mode-hook 'dm/programming-mode-hook)
(add-hook 'go-mode-hook 'dm/go-mode-keybindings)
(add-hook 'go-mode-hook 'fontify-at-todo)

;;;; temp (add-hook 'before-save-hook 'gofmt-before-save)
