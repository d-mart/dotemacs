;; General configuration tweaks to emacs to affect
;; memory usage and computation speed

; Garbage collect at 30MB (default -> 800,000 bytes)
(setq gc-cons-threshold 30000000)

;; Avoid performance issues in files with very long lines.
(global-so-long-mode 1)

;; more long-line tweaks
; https://emacs.stackexchange.com/questions/598/how-do-i-prevent-extremely-long-lines-making-emacs-slow
(setq bidi-paragraph-direction 'left-to-right)
(setq bidi-inhibit-bpa t)
