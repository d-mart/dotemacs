;;;
;;; Configuration and mode customization for
;;; ruby and rails
;;;

;; Cucumber testing framework
(autoload 'feature-mode "feature-mode"
          "Cucumber feature mode for emacs" t)

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



;; colorize punctuation
;(font-lock-add-keywords 'ruby-mode
;    '(("\\([][()~^<>=,.\\+*/%-]\\)" 0 'font-lock-punctuation-face)))
;; colorize numbers
;(font-lock-add-keywords 'ruby-mode
;    '(("\\<[\\+-]?[0-9]+\\(.[0-9A-Fa-f]+\\)?\\>" 0 'font-lock-digit-face)))

;; highlight dangling whitespace
;(add-hook 'ruby-mode-hook       'show-ws-toggle-show-trailing-whitespace)

;; @todo - add these keywords as font-lock-keyword-face
;; background it describe context include require_dependency
(font-lock-add-keywords 'ruby-mode
                        '(("require\\(_dependency\\)?" 0 'font-lock-keyword-face)
                          (" it "                      0 'font-lock-keyword-face)
                          ("describe"                  0 'font-lock-keyword-face)
                          ("context"                   0 'font-lock-keyword-face)
                          ("include"                   0 'font-lock-keyword-face)
                          ("background"                0 'font-lock-keyword-face)
                          ("private"                   0 'font-lock-keyword-face)
                          ("protected"                 0 'font-lock-keyword-face)))

;; Open files matching these 
(append '(("Rakefile$"        . ruby-mode)
          ("Guardfile$"       . ruby-mode)
          ("Capfile"          . ruby-mode)
          ("Gemfile"          . ruby-mode)
          ("\\.rake$"         . ruby-mode)
          ("\\.feature$"      . feature-mode)
          ("\\.yml$"          . yaml-mode)
          ("\\.html.erb"      . rhtml-mode))
          auto-mode-alist
        )
