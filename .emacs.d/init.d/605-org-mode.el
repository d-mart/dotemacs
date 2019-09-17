(setq org-load-defer-seconds 10)

(setq dm/org-babel-languages
      '((emacs-lisp . t)
        (plantuml   . t)
        (ruby       . t)
        (shell      . t)
        (elixir     . t)
        (restclient . t)
        ))

(setq org-edit-src-auto-save-idle-delay 4)

(use-package org-mode
  :defer org-load-defer-seconds
  :init
  (setq org-plantuml-jar-path plantuml-jar-path)
  (setq org-agenda-files (quote (nil)))
  (setq org-ellipsis " … ")
  (setq org-fontify-done-headline t)
  (setq org-fontify-quote-and-verse-blocks t)
  (setq org-fontify-whole-heading-line t)
  (setq org-log-into-drawer "NOTES")
  (setq org-refile-allow-creating-parent-nodes t)
  (setq org-babel-no-eval-on-ctrl-c-ctrl-c nil)
  (setq org-confirm-babel-evaluate nil)

  ; babel blocks
  (setq org-src-tab-acts-natively t)

  ; capture
  (setq org-default-notes-file "~/org/notes.org")

  ;;(setq org-startup-indented t)
  (setf org-blank-before-new-entry '((heading . nil) (plain-list-item . nil)))
  (org-babel-do-load-languages 'org-babel-load-languages dm/org-babel-languages)

  :bind (
         ("C-c C-TAB" . dm/cycle-previous-heading) ; not working
         )
  )

;; Make windmove work in Org mode if shift-arrow won't
;; do anything special
(add-hook 'org-shiftup-final-hook    'windmove-up)
(add-hook 'org-shiftleft-final-hook  'windmove-left)
(add-hook 'org-shiftdown-final-hook  'windmove-down)
(add-hook 'org-shiftright-final-hook 'windmove-right)

;; global bindings for jumping into org-mode
; (global-set-key (kbd "C-c l") 'org-store-link)
; (global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)

(use-package org-tempo
  :defer org-load-defer-seconds
  :init
  (add-to-list 'org-structure-template-alist '("ex"  . "src elixir"))
  (add-to-list 'org-structure-template-alist '("ru"  . "src ruby"))
  (add-to-list 'org-structure-template-alist '("sh"  . "src bash"))
  (add-to-list 'org-structure-template-alist '("sql" . "src sql"))
  )

(use-package org-bullets
  :defer org-load-defer-seconds
  :init
  (progn
    (setq org-bullets-bullet-list '("✺" "✹" "✸" "✷" "✶" "✭" "✦" "■" "▲" "●" ))))

(defun dm/cycle-previous-heading ()
  (interactive)
  (outline-previous-heading)
  (org-cycle))
