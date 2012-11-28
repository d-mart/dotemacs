;; add imenu to programming buffers
(add-hook 'emacs-lisp-mode-hook 'imenu-add-menubar-index)

;; elisp-mode keybindings
(defun my-elisp-mode-keybindings ()
  (define-key emacs-lisp-mode-map (kbd "C-c C-c") 'comment-or-uncomment-region)
  (define-key emacs-lisp-mode-map (kbd "C-c #")   'comment-or-uncomment-region))

(add-hook 'emacs-lisp-mode-hook 'my-elisp-mode-keybindings)

;; file modes
(add-to-list 'auto-mode-alist '("\\.el\\.gz$" . elisp-mode))
