;;; ----------------------
;;; shell mode setup
;;; ----------------------

(defun dm-sh-mode-settings ()
  (setq sh-basic-offset 2)
  (setq sh-indentation 2)
  (message "Loaded dm-sh-mode-settings"))

(defun dm-sh-mode-keybindings ()
  (define-key sh-mode-map (kbd "C-c C-c") 'comment-or-uncomment-region)
  (define-key sh-mode-map (kbd "C-c C-e") 'sh-send-line-or-region))


(add-hook 'sh-mode-hook 'dm/programming-mode-hook)
(add-hook 'sh-mode-hook 'dm-sh-mode-settings)
(add-hook 'sh-mode-hook 'dm-sh-mode-keybindings)

(add-to-list 'auto-mode-alist '("\\.envrc$"       . sh-mode))

;; adpated rom https://stackoverflow.com/questions/6286579/emacs-shell-mode-how-to-send-region-to-shell
;; note there is some similarity / collision with builtin 'sh-script.el - this is maybe not needed
(defun sh-send-line-or-region (&optional step)
  (interactive ())
  (let ((proc (get-process "shell"))
        pbuf min max command)
    (unless proc
      (let ((currbuff (current-buffer)))
        (shell)
        (switch-to-buffer currbuff)
        (setq proc (get-process "shell"))
        ))
    (setq pbuff (process-buffer proc))
    (if (use-region-p)
        (setq min (region-beginning)
              max (region-end))
      (setq min (point-at-bol)
            max (point-at-eol)))
    (setq command (concat (buffer-substring min max) "\n"))
    (with-current-buffer pbuff
      (goto-char (process-mark proc))
      (insert command)
      (move-marker (process-mark proc) (point))
      ) ;;pop-to-buffer does not work with save-current-buffer -- bug?
    (process-send-string  proc command)
    (display-buffer (process-buffer proc) t)
    (when step
      (goto-char max)
      (next-line))
    ))

(defun sh-send-line-or-region-and-step ()
  (interactive)
  (sh-send-line-or-region t))
(defun sh-switch-to-process-buffer ()
  (interactive)
  (pop-to-buffer (process-buffer (get-process "shell")) t))
