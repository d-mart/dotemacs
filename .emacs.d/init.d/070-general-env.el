;; Look and feel / environment settings

; Set cursor color to white
(setq dm/cursor-color "#ffffff")
(set-cursor-color dm/cursor-color)

(use-package beacon
  :init
  (beacon-mode 1)
  (setq beacon-push-mark 35)
  (setq beacon-color "#666600"))

(use-package amx
  :bind
  ("M-x" . amx))

(if (eq (window-system) 'ns)
    (use-package ns-auto-titlebar
      :init
      (ns-auto-titlebar-mode)))

;; frame setup
(add-to-list 'default-frame-alist '(fullscreen . maximized))

(defun dm/after-make-frame-advice ()
  (fix-frame-font)
  (set-cursor-color dm/cursor-color)
  (set-frame-parameter nil 'fullscreen 'maximized)
  (scroll-bar-mode -1))

(advice-add 'make-frame-command :after #'dm/after-make-frame-advice)

;;
;; Font size
;;
; emacs fonts are set in hundredths of points.
; for example, 110 height ==> 11pts
(defun dm/increase-font-size ()
  (interactive)
  (set-face-attribute 'default nil :height
    (+ (face-attribute 'default :height) 10)))

(defun dm/decrease-font-size ()
  (interactive)
  (set-face-attribute 'default nil :height
    (- (face-attribute 'default :height) 10)))

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
      ;; TODO - set these *in* the theme somehow
      (custom-set-faces
       '(org-level-4 ((t (:inherit org-level-3 :foreground "SeaGreen2"))))
       '(org-level-5 ((t (:inherit org-level-3 :foreground "SkyBlue2"))))
       '(org-level-6 ((t (:inherit org-level-3 :foreground "goldenrod2"))))
       '(org-level-8 ((t (:foreground "NavajoWhite3" :weight semi-bold)))))
      )

     ((eq current-theme 'darkokai)
      (message "setting darkokai special theme sauce")
      (custom-set-faces
       '(org-block ((t (:foreground "wheat3"))))
       )
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
