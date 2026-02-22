;;; test-helper.el --- Shared helpers for dotemacs tests -*- lexical-binding: t; -*-

(require 'ert)

(defconst dotemacs-test-root
  (expand-file-name ".." (file-name-directory (or load-file-name buffer-file-name)))
  "Repository root for dotemacs tests.")

(defconst dotemacs-test-emacs-dir
  (expand-file-name ".emacs.d" dotemacs-test-root)
  "Path to the .emacs.d directory under test.")

(setq user-emacs-directory (file-name-as-directory dotemacs-test-emacs-dir))

;; Load utility modules with custom functions we validate in ERT tests.
(load-file (expand-file-name "misc-utils.el" dotemacs-test-emacs-dir))
(load-file (expand-file-name "my-misc-utils.el" dotemacs-test-emacs-dir))

(defmacro dotemacs-test-with-content (content &rest body)
  "Create a temp buffer with CONTENT and run BODY inside it."
  (declare (indent 1))
  `(with-temp-buffer
     (insert ,content)
     (goto-char (point-min))
     ,@body))

(provide 'test-helper)
