
;;; ----------------------
;;; Git setup
;;; ----------------------

(use-package blamer
  :ensure nil
  :defer 20
  :custom
  (blamer-idle-time 0.1)
  (blamer-min-offset 70)
  :custom-face
  (blamer-face ((t :foreground "#6a78af"
                    :background nil
                    :italic t)))
  :config
  (global-blamer-mode nil))

(autoload 'magit-status "magit"
          "Magit emacs git interface" t)
(autoload 'magit-blame-mode "magit-blame"
          "Magit Blame mode" t)
(autoload 'git-commit-mode "git-commit-mode"
          "git commit message editing mode" t)

;; ------------------
;; Keyboard macro to get story number from branch name
;; in COMMIT_MSG buffers and insert it at the begginging
;; of the commit comment
;; ------------------
(fset 'commit-msg-insert-story-number
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([19 98 114 97 110 99 104 32 91 48 45 57 93 13 2 67108896 134217830 17 134217788 91 35 25 93 32] 0 "%d")) arg)))

(defalias 'mag 'magit-status)
(defalias 'mgb 'magit-blame)
(defalias 'gg  'vc-git-grep)

;(setq magit-last-seen-setup-instructions "1.4.0")
