;;;
;;; Configuration and mode customization for
;;; eww and launching URLs
;;;

(setq browse-url-browser-function 'eww-browse-url)
;(setq browse-url-browser-function 'browse-url-firefox)

; A little help finding firefox on OSX
(cond ((eq system-type 'darwin)
       (setq browse-url-firefox-program "/Applications/Firefox.app/Contents/MacOS/firefox")))

(defun my-eww-mode-keybindings ()
  (define-key eww-mode-map (kbd "h") 'backward-char)
  (define-key eww-mode-map (kbd "j") 'next-line)
  (define-key eww-mode-map (kbd "k") 'previous-line)
  (define-key eww-mode-map (kbd "l") 'forward-char)

  (define-key eww-mode-map (kbd "f") 'eww-forward-url)
  (define-key eww-mode-map (kbd "b") 'eww-back-url))

(defun my-eww-mode-hook () )

(add-hook 'eww-mode-hook 'my-eww-mode-keybindings)
(add-hook 'eww-mode-hook 'my-eww-mode-hook)

(use-package restclient
  :init
  (setq auto-mode-alist
        (append '(("\\.http$" . restclient-mode)) auto-mode-alist))
  :bind
  ("C-c C-b" . dm/post-body-toggle))
