;;; ----------------------
;;; Erlang
;;; ----------------------

(defun my-erlang-settings ()
  (setq erlang-indent-level 2)
  (setq tab-width 2))

(add-hook 'erlang-mode-hook 'my-erlang-settings)

(add-to-list 'auto-mode-alist '("\\.hrl$" . erlang-mode))
(add-to-list 'auto-mode-alist '("\\.erl$" . erlang-mode))

(defun erlang-indent-command (&optional whole-exp)
  "Indent current line as Erlang code.
With argument, indent any additional lines of the same clause
rigidly along with this one."
  (interactive "P")
  (if whole-exp
      ;; If arg, always indent this line as Erlang
      ;; and shift remaining lines of clause the same amount.
      (let ((shift-amt (erlang-indent-line))
            beg end)
        (save-excursion
          (if erlang-tab-always-indent
              (beginning-of-line))
          (setq beg (point))
          (erlang-end-of-clause 1)
          (setq end (point))
          (goto-char beg)
          (forward-line 1)
          (setq beg (point)))
        (if (> end beg)
            (indent-code-rigidly beg end shift-amt "\n")))
    (if (and (not erlang-tab-always-indent)
             (save-excursion
               (skip-chars-backward " \t")
               (not (bolp))))
        (insert "  ")
      (erlang-indent-line))))
