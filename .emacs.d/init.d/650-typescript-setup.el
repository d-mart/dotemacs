;;; ----------------------
;;; javascript setup
;;; ----------------------
(use-package typescript-mode)

(defun dm/ts-mode-settings ())

(defun dm/ts-mode-keybindings ())

(add-hook 'typescript-mode-hook 'dm/programming-mode-hook)
(add-hook 'typescript-mode-hook 'dm/programming-mode-keybindings)
(add-hook 'typescript-mode-hook 'dm/ts-mode-settings)
(add-hook 'typescript-mode-hook 'dm/ts-mode-keybindings)
