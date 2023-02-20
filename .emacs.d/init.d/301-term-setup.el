;; ------------------
;; Shell / Terminal
;; ------------------

(setq ansi-term-color-vector [term term-color-black term-color-red term-color-green term-color-yellow term-color-blue term-color-magenta term-color-cyan term-color-white])

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
;; use UTF-8 in shells
(defun my-term-use-utf8 ()
  (set-buffer-process-coding-system 'utf-8-unix 'utf-8-unix))
(add-hook 'term-exec-hook 'my-term-use-utf8)

;; ----------------
;; Improvements from http://emacs-journey.blogspot.com/2012/06/improving-ansi-term.html
;; Close term window after shell process exits
;; ----------------
(defadvice term-sentinel (around my-advice-term-sentinel (proc msg))
  (if (memq (process-status proc) '(signal exit))
      (let ((buffer (process-buffer proc)))
        ad-do-it
        (kill-buffer buffer))
    ad-do-it))
(ad-activate 'term-sentinel)

;; -----------------
;; some themes set an 'undefined' term which doesn't seem to be valid anymore
;; quick way to restore to working behavior
;; -----------------
(defun fix-term-faces ()
  (interactive)
  (setq ansi-term-color-vector [term term-color-black term-color-red term-color-green term-color-yellow term-color-blue term-color-magenta term-color-cyan term-color-white]))

;; ----------------
;; Toggle back and forth between line and char mode in term-mode
;; ----------------
(defun dm/toggle-term-line-char-mode ()
  (interactive)
  (if (term-in-char-mode)
    (term-line-mode)
    (term-char-mode)))

;; ----------------
;; Term bindings / hook
;; ----------------
(defun dm/term-keybindings ()
  (define-key term-raw-map (kbd "C-y")     'term-paste)
  (define-key term-raw-map (kbd "C-c C-j") 'dm/toggle-term-line-char-mode)
  (define-key term-raw-map (kbd "C-c C-k") 'dm/toggle-term-line-char-mode)
  (define-key term-raw-map (kbd "C-\\")    'dm/toggle-term-line-char-mode)

  (define-key term-mode-map (kbd "C-c C-j") 'dm/toggle-term-line-char-mode)
  (define-key term-mode-map (kbd "C-c C-k") 'dm/toggle-term-line-char-mode)
  (define-key term-mode-map (kbd "C-\\")    'dm/toggle-term-line-char-mode))

(defun dm/term-hook ()
  (goto-address-mode) ;; clickable addresses in term buffers
  (dm/term-keybindings)
  (fix-term-faces)
  (yas-minor-mode -1))

(add-hook 'term-mode-hook 'dm/term-hook)

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
;; Launch a shell command with its output
;; funnelled to its own buffer
;; ----------------
(defun m-shell-command ()
  "Launch a shell command."
  (interactive)
  (let ((command (read-string "Command: ")))
    (shell-command (concat command " &") (concat "*" command "*"))))

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
