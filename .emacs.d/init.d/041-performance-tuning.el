;; General configuration tweaks to emacs to affect
;; memory usage and computation speed

; Garbage collect at 30MB (default -> 800,000 bytes)
(setq gc-cons-threshold 30000000)

;; Avoid performance issues in files with very long lines.
(global-so-long-mode 1)
