;; ------------------
;; Shell / Terminal
;; ------------------
;; Add color to a shell running in emacs ‘M-x shell’
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; set maximum-buffer size for shell-mode
;;(setq comint-buffer-maximum-size 10240)
;; truncate shell buffer to comint-buffer-maximum-size
(add-hook 'comint-output-filter-functions
          'comint-truncate-buffer)

;; dont show passwords in clear text
(add-hook 'comint-output-filter-functions
          'comint-watch-for-password-prompt)

;; remove ctrl-m from shell output
(add-hook 'comint-output-filter-functions
          'comint-strip-ctrl-m)

(add-hook 'shell-mode-hook
          '(lambda ()
             (local-set-key [home]        ; move to beginning of line, after prompt
                            'comint-bol)
             (local-set-key [up]          ; cycle backward through command history
                            '(lambda () (interactive)
                               (if (comint-after-pmark-p)
                                   (comint-previous-input 1)
                                 (previous-line 1))))
             (local-set-key [down]        ; cycle forward through command history
                            '(lambda () (interactive)
                               (if (comint-after-pmark-p)
                                   (comint-next-input 1)
                                 (forward-line 1))))))


;; ----------------
;; Insert the filename of the active buffer just
;; before the minibuffer was activated.  Useful for running
;; shell-command and inserting the buffer name to operate on
;; ----------------
(define-key minibuffer-local-map [f3]
  (lambda() (interactive)
    (let ((bfn (buffer-file-name (nth 1 (buffer-list)))))
      (when bfn (insert bfn)))))


;; ----------------
;; Switch to, bury, or create
;; an ansi-term buffer depending
;; on state.
;; if current buffer is *bash*, bury
;; if *bash* exists but is not current, switch to
;; if *bash* doesn't exist, create and switch to
;; ----------------
(defun switch-to-or-create-shell ()
  "Bury, switch to or create ansi-term bash buffer"
  (interactive)
  (if (string= (buffer-name (current-buffer)) "*bash*")
      (bury-buffer)
      (if (get-buffer "*bash*")
           (switch-to-buffer "*bash*")
           (ansi-term "bash" "bash"))))
