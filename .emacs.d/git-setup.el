
;;; ----------------------
;;; Git setup
;;; ----------------------

(autoload 'magit-status "magit"
          "Magit emacs git interface" t)
(autoload 'magit-blame-mode "magit-blame"
          "Magit Blame mode" t)
(autoload 'git-commit-mode "git-commit-mode"
          "git commit message editing mode" t)

(defalias 'mag 'magit-status)
(defalias 'mgb 'magit-blame-mode)
(defalias 'gg  'vc-git-grep)

(setq auto-mode-alist
      (append '(("COMMIT_EDITMSG$"  . git-commit-mode))
              auto-mode-alist))
