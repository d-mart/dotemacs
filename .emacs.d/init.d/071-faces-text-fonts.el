
;;
;; Typefaces and Fonts
;;

;; from https://stackoverflow.com/questions/24705984/increase-decrease-font-size-in-an-emacs-frame-not-just-buffer
(defun zoom-frame (&optional n frame amt)
  "Increase the default size of text by AMT inside FRAME N times.
  N can be given as a prefix arg.
  AMT will default to 10.
  FRAME will default the selected frame."
  (interactive "p")
  (let ((frame (or frame (selected-frame)))
        (height (+ (face-attribute 'default :height frame) (* n (or amt 10)))))
    (set-face-attribute 'default frame :height height)
    (when (called-interactively-p)
      (message "Set frame's default text height to %d." height))))

(defun zoom-frame-out (&optional n frame amt)
  "Call `zoom-frame' with -N."
  (interactive "p")
  (zoom-frame (- n) frame amt))

(global-set-key (kbd "C-c z i") 'zoom-frame)
(global-set-key (kbd "C-c z o") 'zoom-frame-out)

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
;; Themes and Faces
;;
(defvar dm/selected-theme 'doom-dark+ ;'darkokai ;'doom-molokai
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

     ((eq current-theme 'doom-dark+)
      (message "setting doom-dark+ special theme sauce")
      (custom-set-faces
      '(outline-3 ((t (:extend t :foreground "medium sea green" :weight bold)))))
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
