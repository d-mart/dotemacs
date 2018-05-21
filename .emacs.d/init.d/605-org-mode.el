(setq org-load-defer-seconds 10)

(setq dm/org-babel-languages
      '((emacs-lisp . t)
        (plantuml   . t)
        (ruby       . t)
        (shell      . t)
        (elixir     . t)
        (restclient . t)
        ))

;; TODO: embetter this
(setq org-plantuml-jar-path "/usr/local/Cellar/plantuml/8057/libexec/plantuml.jar")

(setq org-edit-src-auto-save-idle-delay 4)

(use-package org-mode
  :defer org-load-defer-seconds
  :init
  (setq org-log-into-drawer "NOTES")
  (setq org-refile-allow-creating-parent-nodes t)
  (setq org-agenda-files '("~/org/bross_release.org"))
  ;;(setq org-startup-indented t)
  (setf org-blank-before-new-entry '((heading . nil) (plain-list-item . nil)))
  (org-babel-do-load-languages 'org-babel-load-languages dm/org-babel-languages)
  ;:bind ()
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

(define-key org-mode-map [(control c) (control tab)] 'dm/cycle-previous-heading)
