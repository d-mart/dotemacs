(use-package paredit)

;; elisp-mode keybindings
(defun dm/elisp-mode-keybindings ()
  (define-key emacs-lisp-mode-map (kbd "C-c C-c") 'comment-or-uncomment-region)
  (define-key emacs-lisp-mode-map (kbd "C-c #")   'comment-or-uncomment-region))

(defun dm/elisp-mode-hook ()
  (enable-paredit-mode))

(add-hook 'emacs-lisp-mode-hook 'my-programming-mode-hook)
(add-hook 'emacs-lisp-mode-hook 'dm/elisp-mode-keybindings)
(add-hook 'emacs-lisp-mode-hook 'dm/elisp-mode-hook)
(add-hook 'emacs-lisp-mode-hook 'fontify-at-todo)

;; file modes
(add-to-list 'auto-mode-alist '("\\.el\\.gz$" . emacs-lisp-mode))
(add-to-list 'auto-mode-alist '("Cask" . emacs-lisp-mode))

;; Elisp go-to-definition with M-. and back again with M-,
(autoload 'elisp-slime-nav-mode "elisp-slime-nav")
;(add-hook 'emacs-lisp-mode-hook (lambda () (elisp-slime-nav-mode t)))
(eval-after-load 'elisp-slime-nav '(diminish 'elisp-slime-nav-mode))
