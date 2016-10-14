;;; ----------------------
;;; shell mode setup
;;; ----------------------

(defun dm-sh-mode-settings ()
  (setq sh-basic-offset 2)
  (setq sh-indentation 2)
  (message "Loaded dm-sh-mode-settings"))

(defun dm-sh-mode-keybindings ())

(add-hook 'sh-mode-hook 'my-programming-mode-hook)
(add-hook 'sh-mode-hook 'dm-sh-mode-settings)

(add-to-list 'auto-mode-alist '("\\.envrc$"       . sh-mode))
