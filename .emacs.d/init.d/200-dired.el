
;; adopted from https://stackoverflow.com/questions/19907939/how-can-one-quickly-browse-through-lots-of-files-in-emacs#19908881
(defun dm/dired-mode-keybindings ()
  (define-key dired-mode-map (kbd "C-o") 'dired-view-current)     ; was dired-display-file
  (define-key dired-mode-map (kbd "n")   'dired-view-next)           ; was dired-next-line
  (define-key dired-mode-map (kbd "p")   'dired-view-previous)) ; was dired-previous-line

(add-hook 'dired-mode-hook 'dm/dired-mode-keybindings)
(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)

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
