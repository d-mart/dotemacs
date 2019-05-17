
;; These variables inform emacs when to split a window or re-use one
;split-width-threshold
;split-height-threshold



;; ----------------
;; Toggle Window Dedication
;; ----------------
(defun toggle-window-dedicated ()
  "Toggle whether the current active window is dedicated or not"
  (interactive)
  (message
   (if (let (window (get-buffer-window (current-buffer)))
         (set-window-dedicated-p window
                                 (not (window-dedicated-p window))))
     "Window '%s' is dedicated"
     "Window '%s' is normal")
   (current-buffer)))

; make a window stick with a buffer
(global-set-key (kbd "C-z d") 'toggle-window-dedicated)
