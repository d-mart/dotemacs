;; -----------------
;; eshell config
;; -----------------
(use-package eshell-autojump
  :init
  (require 'eshell-z))

(use-package eshell-prompt-extras
  :init
  (with-eval-after-load "esh-opt"
    (autoload 'epe-theme-dakrone "eshell-prompt-extras")
    (setq eshell-highlight-prompt nil
          eshell-prompt-function 'epe-theme-dakrone)))

(use-package eshell-syntax-highlighting
  :after esh-mode
  :demand t ;; Install if not already installed.
  :config
  ;; Enable in all Eshell buffers.
  (eshell-syntax-highlighting-global-mode +1))

(defun eshell/ll (&rest args)
  "a shortcut for ls that automatically adds some flags to the ls"
  (eshell/ls "-l" "-a" args))

(defun dm/eshell-mode-keybindings ()
  "keymappings for use in eshell"
  )

(defun dm/eshell-mode-hook ()
  "personal eshell sauce"
  (dm/eshell-mode-keybindings))

(add-hook 'eshell-mode-hook 'dm/eshell-mode-hook)

;; see also:
;;; eshell-aliases-file var -> defaults ~/.emacs.d/eshell/alias
;;; refresh aliases after editing with eshell-read-aliases-list

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
