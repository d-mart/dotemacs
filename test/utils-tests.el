;;; utils-tests.el --- ERT tests for local utility functions -*- lexical-binding: t; -*-

(require 'ert)
(require 'test-helper)

(ert-deftest dotemacs-uniquify-all-lines-buffer ()
  (dotemacs-test-with-content "a\nb\na\nc\nb\n"
    (uniquify-all-lines-buffer)
    (should (equal (buffer-string) "a\nb\nc\n"))))

(ert-deftest dotemacs-join-lines-with-comma ()
  (dotemacs-test-with-content "a\nb\nc"
    (set-mark (point-min))
    (goto-char (point-max))
    (activate-mark)
    (dm/join-lines-with-comma (region-beginning) (region-end))
    (should (equal (buffer-string) "a,b,c"))))

(ert-deftest dotemacs-split-on-str ()
  (dotemacs-test-with-content "foo=bar=baz"
    (dm/split-on-str "=")
    (should (equal (buffer-string) "foo\nbar\nbaz"))))

(ert-deftest dotemacs-post-body-toggle-roundtrip ()
  (dotemacs-test-with-content "foo=bar&baz=qux"
    (set-mark (point-min))
    (goto-char (point-max))
    (activate-mark)
    (dm/post-body-toggle)
    (should (equal (buffer-string) "foo=bar\nbaz=qux"))
    (set-mark (point-min))
    (goto-char (point-max))
    (activate-mark)
    (dm/post-body-toggle)
    (should (equal (buffer-string) "foo=bar&baz=qux"))))

(ert-deftest dotemacs-kill-start-of-line ()
  (dotemacs-test-with-content "abc def"
    (goto-char (point-max))
    (kill-start-of-line)
    (should (equal (buffer-string) ""))))

(ert-deftest dotemacs-tab-width-alias ()
  (should (fboundp 'tw))
  (should (eq (indirect-function 'tw)
              (indirect-function 'set-tab-width))))

(ert-deftest dotemacs-global-root-edit-binding ()
  (should (eq (lookup-key global-map (kbd "C-x F"))
              #'djcb-find-file-as-root)))
