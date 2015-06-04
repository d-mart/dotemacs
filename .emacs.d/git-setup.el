
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

(setq magit-last-seen-setup-instructions "1.4.0")

(setq auto-mode-alist
      (append '(("COMMIT_EDITMSG$"  . git-commit-mode))
              auto-mode-alist))

;; git-gutter-fringe - git diff bitmap markers in margin
;(require 'git-gutter-fringe)
;(setq-default git-gutter-fr:side 'left-fringe)
;(setq-default left-fringe-width 8)
;(set-face-foreground 'git-gutter-fr:added    "green")
;(set-face-foreground 'git-gutter-fr:modified "yellow")
;(set-face-foreground 'git-gutter-fr:deleted   "red")
;(defalias 'ggm 'git-gutter:toggle)
;(defun my-git-gutter-hook () (git-gutter))
;(add-hook 'find-file-hook 'my-git-gutter-hook)

;; from https://gist.github.com/4169777
;; look at diff when writing a commit message
;; (defun magit-log-show-diff ()
;;   (interactive)
;;   (let ((content (magit-cmd-output "git" '("diff" "--cached" "-U5"))))
;;     (with-current-buffer (get-buffer-create "*vc-diff*")
;;       (let ((buffer-undo-list t)
;;             (inhibit-read-only t))
;;         (erase-buffer)
;;         (insert content))
;;       (diff-mode)
;;       (setq buffer-read-only t)
;;       (display-buffer (current-buffer)))))

;; (define-key magit-log-edit-mode-map (kbd "C-c C-d") 'magit-log-show-diff)
