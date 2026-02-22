;;; run-tests.el --- Batch test entrypoint -*- lexical-binding: t; -*-

(add-to-list 'load-path (file-name-directory (or load-file-name buffer-file-name)))

(require 'test-helper)
(load-file (expand-file-name "utils-tests.el"
                             (file-name-directory (or load-file-name buffer-file-name))))

(ert-run-tests-batch-and-exit t)
