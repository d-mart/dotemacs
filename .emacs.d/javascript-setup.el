;;; ----------------------
;;; Javascript setup
;;; ----------------------

(defun my-js-mode-settings ()
  (setq js-indent-level 2))

(defun my-js-mode-keybindings ()
  ;(define-key javascript-mode-map (kbd "C-c C-c") 'comment-or-uncomment-region)
)

(custom-set-variables
 '(js2-basic-offset 2)
 '(js2-bounce-indent-p nil)
 '(js2-highlight-level 3)
 '(js2-mode-indent-ignore-first-tab t)
)

(add-hook 'js2-mode-hook 'my-programming-mode-hook)
(add-hook 'js2-mode-hook 'my-js-mode-settings)
(add-hook 'js2-mode-hook 'my-js-mode-keybindings)

(add-to-list 'auto-mode-alist '("\\.js$"     . js2-mode))
(add-to-list 'auto-mode-alist '("\\.js.erb$" . js2-mode))
