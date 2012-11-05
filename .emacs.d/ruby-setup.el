;;;
;;; Configuration and mode customization for
;;; ruby and rails
;;;

;; Cucumber testing framework
(autoload 'feature-mode "feature-mode"
          "Cucumber feature mode for emacs" t)
;; rhtml mode for editing erb files
(autoload 'rhtml-mode "rhtml-mode"
          "RHTML embedded ruby editing mode" t)

;; Ruby-mode keybindings
(defun my-ruby-mode-keybindings ()
  (define-key ruby-mode-map (kbd "C-c C-c") 'comment-or-uncomment-region)
  (define-key ruby-mode-map (kbd "C-c #")   'comment-or-uncomment-region)
  (define-key ruby-mode-map (kbd "C-c t")   'ruby-compilation-this-buffer)
  (define-key ruby-mode-map (kbd "C-c r")   'ruby-compilation-run)
  (define-key ruby-mode-map (kbd "C-c C-r") 'ruby-compilation-rake))

(add-hook 'ruby-mode-hook 'my-ruby-mode-keybindings)
;(add-hook 'ruby-mode-hook 'ruby-electric-mode)
(add-hook 'ruby-mode-hook 'ruby-interpolation-mode)

;; add imenu to programming buffers
(add-hook 'ruby-mode-hook       'imenu-add-menubar-index)

;; Feature-mode bindings
(defun my-feature-mode-keybindings ()
  (define-key ruby-mode-map (kbd "C-c C-c") 'comment-or-uncomment-region)
  (define-key ruby-mode-map (kbd "C-c #")   'comment-or-uncomment-region))

(add-hook 'feature-mode-hook 'my-feature-mode-keybindings)

;; colorize punctuation
;(font-lock-add-keywords 'ruby-mode
;    '(("\\([][()~^<>=,.\\+*/%-]\\)" 0 'font-lock-punctuation-face)))
;; colorize numbers
;(font-lock-add-keywords 'ruby-mode
;    '(("\\<[\\+-]?[0-9]+\\(.[0-9A-Fa-f]+\\)?\\>" 0 'font-lock-digit-face)))

;; highlight dangling whitespace
;(add-hook 'ruby-mode-hook       'show-ws-toggle-show-trailing-whitespace)

;; @todo - improve regexen so they only match as first no-
;;         whitespace chars on line
(font-lock-add-keywords 'ruby-mode
                        '(("^[[:space:]]*require\\(_dependency\\)?\\b" 0 'font-lock-keyword-face)
                          ("^[[:space:]]*it\\b"                        0 'font-lock-keyword-face)
                          ("^[[:space:]]*describe\\b"                  0 'font-lock-keyword-face)
                          ("^[[:space:]]*context\\b"                   0 'font-lock-keyword-face)
                          ("^[[:space:]]*include\\b"                   0 'font-lock-keyword-face)
                          ("^[[:space:]]*background\\b"                0 'font-lock-keyword-face)
                          ("^[[:space:]]*private\\b"                   0 'font-lock-keyword-face)
                          ("^[[:space:]]*protected\\b"                 0 'font-lock-keyword-face)))

;; Open files matching these 
(setq auto-mode-list
      (append '(("Rakefile$"              . ruby-mode)
                ("Guardfile$"             . ruby-mode)
                ("Capfile"                . ruby-mode)
                ("Gemfile\\(\\ .lock\])?" . ruby-mode)
                ("\\.rake$"               . ruby-mode)
                ("\\.feature$"            . feature-mode)
                ("\\.html.erb"            . rhtml-mode))
               auto-mode-alist))
