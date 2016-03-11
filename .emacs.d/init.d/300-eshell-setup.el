;; -----------------
;; eshell config
;; -----------------
(use-package eshell-autojump
  :init
  (require 'eshell-z))


(use-package shell-prompt-extras
  :init
  (with-eval-after-load "esh-opt"
    (autoload 'epe-theme-dakrone "eshell-prompt-extras")
    (setq eshell-highlight-prompt nil
          eshell-prompt-function 'epe-theme-dakrone)))

;(defmacro with-face (str &rest properties)
;  `(propertize ,str 'face (list ,@properties)))
;
;(defun shk-eshell-prompt ()
;  (let ((header-bg "#111111"))
;    (concat
;     (with-face (concat (eshell/pwd) " ") :background header-bg)
;     (with-face (format-time-string "(%Y-%m-%d %H:%M) " (current-time)) :background header-bg :foreground "#888")
;     (with-face
;      (or (ignore-errors (format "(%s)" (vc-responsible-backend default-directory))) "")
;      :background header-bg)
;     (with-face "\n" :background header-bg)
;     (with-face user-login-name :foreground "blue")
;     "@"
;     (with-face "localhost" :foreground "green")
;     (if (= (user-uid) 0)
;         (with-face " #" :foreground "red")
;       " $")
;     " ")))
;
;(setq eshell-prompt-function 'shk-eshell-prompt)
;(setq eshell-highlight-prompt nil)
