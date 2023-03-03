;; Look and feel / environment settings

(use-package exec-path-from-shell
  :ensure t
  :init (exec-path-from-shell-initialize))

; Set cursor color to white
(setq dm/cursor-color "#ffffff")
(set-cursor-color dm/cursor-color)

(use-package beacon
  :init
  (beacon-mode 1)
  (setq beacon-push-mark 35)
  (setq beacon-color "#666600"))

(use-package ido-completing-read+)
(use-package amx
  :bind
  ("M-x" . amx))

(if (eq (window-system) 'ns)
    (use-package ns-auto-titlebar
      :init
      (ns-auto-titlebar-mode)))

(use-package doom-modeline
  :ensure t
  :init
  (setq doom-modeline-buffer-file-name-style 'truncate-upto-project) ; 'auto
  (setq doom-modeline-major-mode-icon t)
  (setq doom-modeline-major-mode-color-icon t)
  (setq doom-modeline-enable-word-count t)
  (setq doom-modeline-buffer-encoding nil)
  (doom-modeline-mode 1))

;; frame setup
(add-to-list 'default-frame-alist '(fullscreen . maximized))

(defun dm/after-make-frame-advice ()
  (fix-frame-font)
  (set-cursor-color dm/cursor-color)
  (set-frame-parameter nil 'fullscreen 'maximized)
  (scroll-bar-mode -1))

(advice-add 'make-frame-command :after #'dm/after-make-frame-advice)
