;;;------------------
;;; Dired setup
;;;------------------

;; dired+ - Lots of improvements to dir listing buffers
(require 'dired+)

;; dired-details - (Optionally) hide mode, owner, date, size
(require 'dired-details)
(dired-details-install)

;; from emacswiki - show dired buffers with directories listed first
(defun mydired-sort ()
  "Sort dired listings with directories first."
  (save-excursion
    (let (buffer-read-only)
      (forward-line 2) ;; beyond dir. header
      (sort-regexp-fields t "^.*$" "[ ]*." (point) (point-max)))
    (set-buffer-modified-p nil)))

(defadvice dired-readin
  (after dired-after-updating-hook first () activate)
  "Sort dired listings with directories first before adding marks."
  (mydired-sort))

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

;; - Get a warning on the modeline when editing a file as root
(defun my-mode-line-function ()
  (when (string-match "^/su\\(do\\)?:" default-directory)
    (setq mode-line-format
          (format-mode-line mode-line-format 'font-lock-warning-face))))
(add-hook 'find-file-hooks 'my-mode-line-function)
(add-hook 'dired-mode-hook 'my-mode-line-function)

;; Auto-refresh dired on file change
(add-hook 'dired-mode-hook 'auto-revert-mode)
