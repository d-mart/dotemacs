;; add imenu to programming buffers
(add-hook 'emacs-lisp-mode-hook 'imenu-add-menubar-index)

;; elisp-mode keybindings
(defun my-elisp-mode-keybindings ()
  (define-key emacs-lisp-mode-map (kbd "C-c C-c") 'comment-or-uncomment-region)
  (define-key emacs-lisp-mode-map (kbd "C-c #")   'comment-or-uncomment-region))

(add-hook 'emacs-lisp-mode-hook 'my-elisp-mode-keybindings)

;; file modes
(add-to-list 'auto-mode-alist '("\\.el\\.gz$" . emacs-lisp-mode))
(add-to-list 'auto-mode-alist '("Cask" . emacs-lisp-mode))

;; Elisp go-to-definition with M-. and back again with M-,
(autoload 'elisp-slime-nav-mode "elisp-slime-nav")
(add-hook 'emacs-lisp-mode-hook (lambda () (elisp-slime-nav-mode t)))
(eval-after-load 'elisp-slime-nav '(diminish 'elisp-slime-nav-mode))
