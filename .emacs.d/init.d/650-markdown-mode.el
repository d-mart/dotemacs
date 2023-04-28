;;;
;;; Configuration and mode customization for
;;; Markdown files
;;;

(use-package markdown-mode)

;; markdown-mode keybindings
(defun my-markdown-mode-keybindings ())

(add-hook 'markdown-mode-hook 'my-markdown-mode-keybindings)
(add-hook 'markdown-mode-hook 'dm/programming-mode-hook)

;; Open files matching these
(add-to-list 'auto-mode-alist '("\\.md$"  . markdown-mode))
