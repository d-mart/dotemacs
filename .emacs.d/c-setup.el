;; C mode
(setq c-basic-offset 4)
(setq c-default-style "linux"
      c-basic-offset 4)
(setq-default substatement-open 0)         ;; braces don't indent from if statements etc
(c-set-offset 'substatement-open 0)
(c-set-offset 'case-label '+)
(c-set-offset 'comment-intro 0)
;; treat underscore '_' as part of a word in c-mode
(modify-syntax-entry ?_ "w" c-mode-syntax-table)

;; C-mode keybindings
(defun my-c-mode-keybindings ()
  (define-key c-mode-map (kbd "C-c C-c") 'comment-or-uncomment-region))
(add-hook 'c-mode-common-hook 'my-c-mode-keybindings)

(add-hook 'c-mode-common-hook (lambda () (setq comment-start "// "
                                               comment-end   "")))

(add-hook 'c-mode-hook          'fontify-at-todo)
;(add-hook 'c-mode-hook          'fontify-punctuation)
;(add-hook 'c-mode-hook          'fontify-numbers)
;; doxymacs mode - assistance with doxygen comments
;(add-hook 'c-mode-hook          'doxymacs-mode)

;; cwarn mode - hilite suspicious c operations, .e.g. if(cond);
(add-hook 'c-mode-hook          'cwarn-mode)

;(add-hook 'c-mode-hook          'idle-highlight)
;(add-hook 'c-mode-hook          'show-ws-toggle-show-trailing-whitespace)
;; add hook to navigate camelCase correctly.  wordBoundariesAtEmbeddedCapitalLetters
(add-hook 'c-mode-hook           'subword-mode)

(add-hook 'c-mode-hook          'imenu-add-menubar-index)
(add-hook 'c-mode-common-hook #'(lambda () (autopair-mode)))

(append '(("\\.[Cc][Xx][Xx]$"  . c++-mode)
          ("\\.[Cc][Pp][Pp]$"  . c++-mode)
          ("\\.[Hh][Xx][Xx]$"  . c++-mode)
          ("\s\.[Tt][Cc][Cc]$" . c++-mode)
          ("\\.i$"             . c++-mode)
          ("\\.h$"             . c-mode)
          ("\\.mak$"           . makefile-mode)
          ("Doxyfile.tmpl$"    . makefile-mode)
          ("Doxyfile$"         . makefile-mode))
        auto-mode-alist)

      
