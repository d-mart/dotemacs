;; Look and feel / environment settings

; Set cursor color to white
(setq dm/cursor-color "#ffffff")
(set-cursor-color dm/cursor-color)

(use-package beacon
  :init
  (beacon-mode 1)
  (setq beacon-push-mark 35)
  (setq beacon-color "#666600"))

(use-package zoom-frm
  :init
  (define-key ctl-x-map (kbd "C-+") 'zoom-in/out)
  (define-key ctl-x-map (kbd "C--") 'zoom-in/out)
  (define-key ctl-x-map (kbd "C-=") 'zoom-in/out)
  (define-key ctl-x-map (kbd "C-0") 'zoom-in/out))

(use-package amx
  :bind
  ("M-x" . amx))

;; frame setup
(add-to-list 'default-frame-alist '(fullscreen . maximized))

(defun dm/after-make-frame-advice ()
  (fix-frame-font)
  (set-cursor-color dm/cursor-color)
  (set-frame-parameter nil 'fullscreen 'maximized)
  (scroll-bar-mode -1))

(advice-add 'make-frame-command :after #'dm/after-make-frame-advice)

;;
;; Theme stuff
;;
(defvar dm/selected-theme 'darkokai ;'doom-molokai
  "theme to activate at emacs start")

(defvar after-load-theme-hook nil
    "Hook run after a color theme is loaded using `load-theme'.")

(defun dm/post-theme-change-adjust-hook ()
  (let ((current-theme (car custom-enabled-themes)))
    (cond
     ((eq current-theme 'doom-molokai)
      (message "setting doom-molokai special theme sauce")
      ;; TODO
      )
     ((eq current-theme 'darkokai)
      (message "setting darkokai special theme sauce")
      ;; TODO
      )
     )))

;; advise load-theme to get a hook when the theme changes
;; @TODO - check if load-theme is called from customize-themes
(defadvice load-theme (after run-after-load-theme-hook activate)
  "Run `after-load-theme-hook'."
  (run-hooks 'after-load-theme-hook))

(defun dm/load-theme ()
  (message "Setting theme: %s" dm/selected-theme)
  (load-theme dm/selected-theme))

(add-hook 'after-init-hook 'dm/load-theme)
(add-hook 'after-load-theme-hook 'dm/post-theme-change-adjust-hook)
