;;; ----------------------
;;; Dart
;;; ----------------------

(defun dm/dart-settings ()
  (sp-local-pair 'dart-mode "<" ">" :wrap "C-<")
  (message "loaded dm/dart-settings"))

(defun dm/dart-mode-keybindings ()
  (define-key dart-mode-map (kbd "C-c C-c") 'comment-or-uncomment-region)
  (define-key dart-mode-map (kbd "C-c #")   'comment-or-uncomment-region)
  )

(add-hook 'dart-mode-hook 'dm/programming-mode-hook)
(add-hook 'dart-mode-hook 'dm/dart-settings)
(add-hook 'dart-mode-hook 'dm/dart-mode-keybindings)
