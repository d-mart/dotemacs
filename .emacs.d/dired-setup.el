;;;------------------
;;; Dired setup
;;;------------------

;; dired+ - Lots of improvements to dir listing buffers
(require 'dired+)

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

(defun my-dired-mode-keybindings ()
  (define-key dired-mode-map (kbd "C-c w") 'wdired-change-to-wdired-mode))

;;;; (add-hook 'dired-mode-hook my-dired-mode-keybindings)

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
;; but don't be chatty about it
(setq auto-revert-verbose nil)

;; This is a minor mode that can be enabled from a dired buffer.
;; Once enabled it will show the file from point in the other window.
;; Moving to the other file within the dired buffer with <down>/<up> or
;; C-n/C-p will display different file.
;; Hitting <SPC> will scroll the peeped file down, whereas
;; C-<SPC> and <backspace> will scroll it up.
(use-package peep-dired
  :config
  (define-key dired-mode-map (kbd "C-c C-p") 'peep-dired))
