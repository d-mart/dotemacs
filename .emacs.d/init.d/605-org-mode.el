(setq dm/org-babel-languages
      '((emacs-lisp . t)
        (plantuml   . t)
        (ruby       . t)
        (shell      . t)
        (elixir     . t)
        (restclient . t)
        (sql        . t)
        ))

;; testing to fix src block indentation
;; (setq org-src-preserve-indentation nil) ; doesn't fix
;; (setq org-edit-src-content-indentation 0) ;no

(use-package org-mode
  :init
  (setq org-plantuml-jar-path plantuml-jar-path)
  (setq org-agenda-files (quote (nil)))
  (setq org-ellipsis " … ")
  (setq org-log-into-drawer "NOTES")
  (setq org-refile-allow-creating-parent-nodes t)
  (setq org-babel-no-eval-on-ctrl-c-ctrl-c nil)
  (setq org-confirm-babel-evaluate nil)
  (setq org-catch-invisible-edits t) ; don't allow edits inside collapsed (invisible) subtrees

  ; speed-commands - trialing
  (setq org-use-speed-commands t) ;
  ;(setq org-speed-commands-user .......) ; add my own

  (setq org-fontify-done-headline t)
  (setq org-fontify-quote-and-verse-blocks t)
  (setq org-fontify-whole-heading-line t)

  ; babel blocks
  (setq org-src-tab-acts-natively t) ; this indents code blocks but also seems to indent the entire SRC block
  (setq org-edit-src-content-indentation 0)
  (setq org-edit-src-auto-save-idle-delay 4)

  ; capture
  (setq org-default-notes-file "~/org/notes.org")
  (setq org-default-tasks-file "~/org/tasks.org")

  ;;(setq org-startup-indented t)
  (setf org-blank-before-new-entry '((heading . nil) (plain-list-item . nil)))
  (org-babel-do-load-languages 'org-babel-load-languages dm/org-babel-languages)

  :bind (
         ("C-c C-\t" . dm/cycle-previous-heading) ; not working
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
  :init
  (add-to-list 'org-structure-template-alist '("ex"  . "src elixir"))
  (add-to-list 'org-structure-template-alist '("ru"  . "src ruby"))
  (add-to-list 'org-structure-template-alist '("sh"  . "src bash"))
  (add-to-list 'org-structure-template-alist '("sql" . "src sql"))
  )

(use-package org-bullets
  :defer t
  :init
  (progn
    (setq org-bullets-bullet-list '("●" "▲" "■" "✦" "✭" "✶" "✷" "✸" "✹" "✺"))
    ;(setq org-bullets-bullet-list '("✺" "✹" "✸" "✷" "✶" "✭" "✦" "■" "▲" "●" ))
    (add-hook 'org-mode-hook 'org-bullets-mode)))

(use-package ob-sql-mode)

(defun dm/cycle-previous-heading ()
  (interactive)
  (outline-previous-heading)
  (org-cycle))

(defun dm/org-mode-hook ()
  (linum-mode -1))

(defun dm/org-daily ()
  (interactive)
  (find-file
   (concat "~/org/daily/" (format-time-string "%Y-%m-%d") ".org")
   ))

(add-hook 'org-mode-hook 'dm/org-mode-hook)
