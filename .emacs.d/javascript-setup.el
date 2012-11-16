;;; ----------------------
;;; Javascript setup
;;; ----------------------

(defun my-js-settings ()
  (setq js-indent-level 2))

(add-hook 'js-mode 'my-js-settings)

(add-to-list 'auto-mode-alist '("\\.js$" . javascript-mode))
