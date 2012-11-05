;; add imenu to programming buffers
(add-hook 'emacs-lisp-mode-hook 'imenu-add-menubar-index)

;; elisp-mode keybindings
(defun my-elisp-mode-keybindings ()
  (define-key emacs-lisp-mode-map (kbd "C-c C-c") 'comment-or-uncomment-region)
  (define-key emacs-lisp-mode-map (kbd "C-c #")   'comment-or-uncomment-region))

(add-hook 'emacs-lisp-mode-hook 'my-elisp-mode-keybindings)

;; file modes
(setq auto-mode-alist
      (append '(("_emacs"           . lisp-mode)
                ("\\.el\\.gz$"      . lisp-mode))
              auto-mode-alist))
