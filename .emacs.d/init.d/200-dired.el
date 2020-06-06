;;;------------------
;;; Dired setup
;;;------------------

(defun dm/dired-mode-keybindings ()
  (define-key dired-mode-map (kbd "C-o")   'dired-view-current)   ; was dired-display-file
  (define-key dired-mode-map (kbd "n")     'dired-view-next)      ; was dired-next-line
  (define-key dired-mode-map (kbd "p")     'dired-view-previous)  ; was dired-previous-line
  (define-key dired-mode-map (kbd "C-c w") 'wdired-change-to-wdired-mode))

(add-hook 'dired-mode-hook 'dm/dired-mode-keybindings)
(add-hook 'dired-mode-hook 'dm/dired-mode-line-function)
(add-hook 'dired-mode-hook 'dired-hide-details-mode)
(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)
(add-hook 'dired-mode-hook 'auto-revert-mode) ;; Auto-refresh dired on file change

(add-hook 'find-file-hooks 'dm/dired-mode-line-function)

(setq auto-revert-verbose nil) ;; don't be chatty about auto-reverts

;; adopted from https://stackoverflow.com/questions/19907939/how-can-one-quickly-browse-through-lots-of-files-in-emacs#19908881
(defun dired-view-next ()
  "Move down one line and view the current file in another window."
  (interactive)
  (dired-next-line 1)
  (dired-view-current))

(defun dired-view-previous ()
  "Move up one line and view the current file in another window."
  (interactive)
  (dired-previous-line 1)
  (dired-view-current))

(defun dired-view-current ()
  "View the current file in another window (possibly newly created)."
  (interactive)
  (if (not (window-parent))
      (split-window))                                   ; create a new window if necessary
  (let ((file (dired-get-file-for-visit))
        (dbuffer (current-buffer)))
    (other-window 1)                                          ; switch to the other window
    (unless (equal dbuffer (current-buffer))                 ; don't kill the dired buffer
      (if (or view-mode (equal major-mode 'dired-mode))   ; only if in view- or dired-mode
          (kill-buffer)))                                                    ; ... kill it
    (let ((filebuffer (get-file-buffer file)))
      (if filebuffer                              ; does a buffer already look at the file
          (switch-to-buffer filebuffer)                                    ; simply switch
        (view-file file))                                                    ; ... view it
      (other-window -1))))                   ; give the attention back to the dired buffer

;;; from emacswiki - show dired buffers with directories listed first
(defun dm/dired-sort ()
  "Sort dired listings with directories first."
  (save-excursion
    (let (buffer-read-only)
      (forward-line 2) ;; beyond dir. header
      (sort-regexp-fields t "^.*$" "[ ]*." (point) (point-max)))
    (set-buffer-modified-p nil)))

(defadvice dired-readin
  (after dired-after-updating-hook first () activate)
  "Sort dired listings with directories first before adding marks."
  'dm/dired-sort)

;; - Get a warning on the modeline when editing a file as root
(defun dm/dired-mode-line-function ()
  (when (string-match "^/su\\(do\\)?:" default-directory)
    (setq mode-line-format
          (format-mode-line mode-line-format 'font-lock-warning-face))))

;; -----------------
;; kill all dired buffers
;; -----------------
(defun kill-all-dired-buffers()
      "Kill all dired buffers."
      (interactive)
      (save-excursion
        (let((count 0))
          (dolist(buffer (buffer-list))
            (set-buffer buffer)
            (when (equal major-mode 'dired-mode)
              (setq count (1+ count))
              (kill-buffer buffer)))
          (message "Killed %i dired buffer(s)." count ))))


(use-package dired-subtree
  :config
  (bind-keys :map dired-mode-map
             ("i" . dired-subtree-insert)
             (";" . dired-subtree-remove)))

(use-package dired-narrow
  :config
  (bind-keys :map dired-mode-map
             ("C-c n" . dired-narrow)
             ("C-c e" . dired-narrow-regexp)))

(use-package dired-filter
  :config
  (bind-keys :map dired-mode-map
             ("C-c C-f" . dired-filter-mode)))

(use-package dired-sidebar
  :ensure t
  :commands (dired-sidebar-toggle-sidebar))

;; This is a minor mode that can be enabled from a dired buffer.
;; Once enabled it will show the file from point in the other window.
;; Moving to the other file within the dired buffer with <down>/<up> or
;; C-n/C-p will display different file.
;; Hitting <SPC> will scroll the peeped file down, whereas
;; C-<SPC> and <backspace> will scroll it up.
(use-package peep-dired
  :config
  (define-key dired-mode-map (kbd "C-c C-p") 'peep-dired))
