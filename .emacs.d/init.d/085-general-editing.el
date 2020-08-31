;; ----------------
;; General editing settings that apply anywhere
;; ----------------
(use-package zzz-to-char
  :init
  ()
  :bind
  (("M-z" . zzz-up-to-char)
   ("M-Z" . zzz-to-char)))


;; ----------------
;; Cursor setup
;; ----------------
; (setq-default cursor-type  '(bar . 3))
(setq cursor-type 'box)
(setq-default cursor-color "#ffffff")

;; change cursor color at each blink
(defvar blink-cursor-colors (list  "#92c48f" "#6785c5" "#be369c" "#d9ca65")
  "On each blink the cursor will cycle to the next color in this list.")

(setq blink-cursor-count 0)
(defun blink-cursor-timer-function ()
  "Zarza wrote this cyberpunk variant of timer `blink-cursor-timer'.
Warning: overwrites original version in `frame.el'.

This one changes the cursor color on each blink. Define colors in `blink-cursor-colors'."
  (when (not (internal-show-cursor-p))
    (when (>= blink-cursor-count (length blink-cursor-colors))
      (setq blink-cursor-count 0))
    (set-cursor-color (nth blink-cursor-count blink-cursor-colors))
    (setq blink-cursor-count (+ 1 blink-cursor-count))
    )
  (internal-show-cursor nil (not (internal-show-cursor-p))))
