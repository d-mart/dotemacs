;; ----------------
;; Project-level packages, settings
;; ----------------

; fiplr - fuzzy find in project (e.g. git repo)
; (global-set-key (kbd "C-x f")   'fiplr-find-file)

;; (use-package find-file-in-project
;;   :init
;;   ()
;;   :bind
;;   (("C-x f" . ffip)))

(use-package counsel-projectile
  :init
  ()
  :bind
  (("C-x f" . counsel-projectile-find-file)))
