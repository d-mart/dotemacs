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

;; rvm.el - make various ruby packages use correct version
;;          ruby according to rvm
(require 'rvm)

;; make rspec-mode use rvm, but not use rake
(setq rspec-use-rvm t)
(setq rspec-use-rake-when-possible nil)
(setq rspec-use-opts-file-when-available nil)

;; yari - make an alias for quick yari-ing
(defalias 'y 'yari-helm)

;; Ruby-mode keybindings
(defun my-ruby-mode-keybindings ()
  (define-key ruby-mode-map (kbd "C-c C-c") 'comment-or-uncomment-region)
  (define-key ruby-mode-map (kbd "C-c #")   'comment-or-uncomment-region)
  (define-key ruby-mode-map (kbd "C-c t")   'ruby-compilation-this-buffer)
  (define-key ruby-mode-map (kbd "C-c r c") 'ruby-compilation-run)
  (define-key ruby-mode-map (kbd "C-c C-r") 'ruby-compilation-rake)
  (define-key ruby-mode-map (kbd "C-c C-d") 'dm-ruby-insert-debugger))

(add-hook 'ruby-mode-hook 'my-programming-mode-hook)
(add-hook 'ruby-mode-hook 'my-ruby-mode-keybindings)
(add-hook 'ruby-mode-hook 'fontify-at-todo)
;; (add-hook 'ruby-mode-hook 'projectile-rails-on)

(require 'ruby-interpolation)
(add-hook 'ruby-mode-hook 'ruby-interpolation-mode)

(add-hook 'ruby-mode-hook 'rspec-mode)

;; add imenu to programming buffers
(add-hook 'ruby-mode-hook 'imenu-add-menubar-index)

;; robe - code navigation and doc for ruby
;; (add-hook 'ruby-mode-hook 'robe-mode)
;; (remove-hook 'robe-mode 'ruby-mode-hook)

;; Note to self:
;; use M-x rvm-activate-corresponding-ruby to activate rvm version for use with Rinari
;; cycle thru rails environments: development, test, production
;(defun rails-cycle-rinari-mode)

;; first pattern theoretically matches mine - rest is default
(setq inf-ruby-prompt-pattern "\\(^[[0-9]+] [?>]> *\\)\\|\\(^[?>]> *\\)\\|\\(^(rdb:1) *\\)\\|\\(^(byebug) *\\)\\|\\(^\\(irb([^)]+)\\|\\([[0-9]+] \\)?[Pp]ry ?([^)]+)\\|\\(jruby-\\|JRUBY-\\)?[1-9]\\.[0-9]\\.[0-9]+\\(-?p?[0-9]+\\)?\\|^rbx-head\\) ?[0-9:]* ?[]>*\"'/`] *\\)")


;; colorize punctuation
;(font-lock-add-keywords 'ruby-mode
;    '(("\\([][()~^<>=,.\\+*/%-]\\)" 0 'font-lock-punctuation-face)))
;; colorize numbers
;(font-lock-add-keywords 'ruby-mode
;    '(("\\<[\\+-]?[0-9]+\\(.[0-9A-Fa-f]+\\)?\\>" 0 'font-lock-digit-face)))

;; highlight dangling whitespace
;(add-hook 'ruby-mode-hook       'show-ws-toggle-show-trailing-whitespace)

(defun dm-ruby-insert-debugger ()
  (interactive)
  (beginning-of-line)
  (open-line 1)
  ;(insert "require 'byebug'; byebug")
  (insert "binding.pry"))

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

(add-to-list 'auto-mode-alist '("Rakefile$"    . ruby-mode))
(add-to-list 'auto-mode-alist '("Guardfile$"   . ruby-mode))
(add-to-list 'auto-mode-alist '("Berksfile$"   . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile"      . ruby-mode))
(add-to-list 'auto-mode-alist '("Vagrantfile"  . ruby-mode))
(add-to-list 'auto-mode-alist '("^Gemfile"     . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$"     . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.i*rbrc"    . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.pryrc"     . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.cap$"      . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.feature$"  . feature-mode))
(add-to-list 'auto-mode-alist '("\\.html.erb"  . rhtml-mode))
