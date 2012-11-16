;;;
;;; Configuration and mode customization for
;;; YML files
;;;

(autoload 'yaml-mode "yaml-mode"
          "YAML syntax highlighting")

;; yaml-mode keybindings
(defun my-yaml-mode-keybindings ()
  (define-key yaml-mode-map (kbd "C-c C-c") 'comment-or-uncomment-region)
  (define-key yaml-mode-map (kbd "C-c #")   'comment-or-uncomment-region))

(add-hook 'yaml-mode-hook 'my-yaml-mode-keybindings)

;; Open files matching these 
(add-to-list 'auto-mode-alist '("\\.yml$"  . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))
