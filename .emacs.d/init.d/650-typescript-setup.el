;;; ----------------------
;;; javascript setup
;;; ----------------------
(use-package typescript-mode)

(defun ts-insert-semicolon-and-newline ()
  "Move to the end of the current line, add a semicolon if one isn't present, and open a new line below."
  (interactive)
  (end-of-line)
  (unless (looking-back ";" 1)
    (insert ";"))
  (newline-and-indent))

(defun dm/ts-mode-settings ()
  (setq typescript-indent-level 2))

(defun dm/ts-mode-keybindings ()
  (define-key typescript-mode-map (kbd "M-<return>") 'ts-insert-semicolon-and-newline))

(add-hook 'typescript-mode-hook 'dm/programming-mode-hook)
(add-hook 'typescript-mode-hook 'dm/programming-mode-keybindings)
(add-hook 'typescript-mode-hook 'dm/ts-mode-settings)
(add-hook 'typescript-mode-hook 'dm/ts-mode-keybindings)
