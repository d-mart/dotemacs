;;; ----------------------
;;; Dart
;;; ----------------------

(defun dm/dart-settings ()
  (sp-local-pair 'dart-mode "<" ">" :wrap "C-<")
  (setq highlight-thing-case-sensitive-p t)
  (setq highlight-thing-delay-seconds 3.5)
  (highlight-thing-mode t)
  (message "loaded dm/dart-settings"))

(defun dm/dart-mode-keybindings ()
  (define-key dart-mode-map (kbd "C-c C-c") 'comment-or-uncomment-region)
  (define-key dart-mode-map (kbd "C-c #")   'comment-or-uncomment-region)
  (define-key dart-mode-map (kbd "C-c h")   'highlight-thing-mode))

(add-hook 'dart-mode-hook 'dm/programming-mode-hook)
(add-hook 'dart-mode-hook 'dm/dart-settings)
(add-hook 'dart-mode-hook 'dm/dart-mode-keybindings)
