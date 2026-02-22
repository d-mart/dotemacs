;;; smoke-parse-config.el --- Read/parse all config files -*- lexical-binding: t; -*-

(require 'cl-lib)

(defconst dotemacs-smoke-root
  (expand-file-name ".." (file-name-directory (or load-file-name buffer-file-name)))
  "Repository root for smoke checks.")

(defconst dotemacs-smoke-config-dir
  (expand-file-name ".emacs.d" dotemacs-smoke-root)
  "Path to .emacs.d for smoke checks.")

(defun dotemacs-smoke-parse-file (file)
  "Read all top-level forms from FILE. Return nil on success or error string."
  (condition-case err
      (with-temp-buffer
        (insert-file-contents file)
        (goto-char (point-min))
        (while t
          (read (current-buffer))))
    (end-of-file nil)
    (error (format "%s: %S" file err))))

(defconst dotemacs-smoke-smart-quote-re "[“”‘’]"
  "Regex matching typographic smart quotes that should not appear in config code.")

(defun dotemacs-smoke-smart-quote-errors (file)
  "Return a list of smart quote errors found in FILE."
  (let (errors)
    (with-temp-buffer
      (insert-file-contents file)
      (goto-char (point-min))
      (while (re-search-forward dotemacs-smoke-smart-quote-re nil t)
        (push (format "%s:%d: smart quote character %S"
                      file
                      (line-number-at-pos)
                      (match-string 0))
              errors)))
    (nreverse errors)))

(let* ((all-files (directory-files-recursively dotemacs-smoke-config-dir "\\.el\\'"))
       (files (cl-remove-if
               (lambda (file)
                 (or (string-match-p "/elpa/" file)
                     (string-match-p "/plugins/" file)))
               all-files))
       (errors nil))
  (dolist (file files)
    (let ((err (dotemacs-smoke-parse-file file)))
      (when err
        (push err errors)))
    (setq errors (nconc errors (dotemacs-smoke-smart-quote-errors file))))
  (if errors
      (progn
        (princ (mapconcat #'identity (nreverse errors) "\n"))
        (kill-emacs 1))
    (princ "SMOKE_PARSE_OK\n")))
