;;; ----------------------
;;; Javascript setup
;;; ----------------------

(defun my-js-mode-settings ()
  (setq js-indent-level 2))

(defun my-js-mode-keybindings ()
  (define-key javascript-mode-map (kbd "C-c C-c") 'comment-or-uncomment-region))

(add-hook 'js-mode-hook 'my-programming-mode-hook)
(add-hook 'js-mode-hook 'my-js-mode-settings)
(add-hook 'js-mode-hook 'my-js-mode-keybindings)

(add-to-list 'auto-mode-alist '("\\.js$"     . javascript-mode))
(add-to-list 'auto-mode-alist '("\\.js.erb$" . javascript-mode))
