;;; ----------------------
;;; Javascript setup
;;; ----------------------
(use-package js2-mode)

(defun dm/js-mode-settings ()
  (custom-set-variables
   '(js2-basic-offset 2)
   '(js2-bounce-indent-p nil)
   '(js2-highlight-level 3)
   '(js2-mode-indent-ignore-first-tab t)
   '(js-indent-level 2)
   '(js2-strict-missing-semi-warning nil)
   '(js2-missing-semi-one-line-override nil)
   ))

(defun dm/js-mode-keybindings ())

(add-hook 'js2-mode-hook 'dm/programming-mode-hook)
(add-hook 'js2-mode-hook 'dm/programming-mode-keybindings)
(add-hook 'js2-mode-hook 'dm/js-mode-settings)
(add-hook 'js2-mode-hook 'dm/js-mode-keybindings)

(add-to-list 'auto-mode-alist '("\\.js$"     . js2-mode))
(add-to-list 'auto-mode-alist '("\\.js.erb$" . js2-mode))

;; ------------------- json mode

(use-package json-mode)

(add-hook 'json-mode-hook 'dm/programming-mode-hook)
(add-hook 'json-mode-hook 'dm/js-mode-settings)
(add-hook 'json-mode-hook 'dm/js-mode-keybindings)

(add-to-list 'auto-mode-alist '("\\.json$" . json-mode))
