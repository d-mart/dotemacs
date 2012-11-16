;;; ----------------------
;;; Erlang
;;; ----------------------

(defun my-erlang-settings ()
  (setq erlang-indent-level 2))

(add-hook 'erlang-mode 'my-erlang-settings)

(add-to-list 'auto-mode-alist '("\\.hrl$" . erlang-mode))
(add-to-list 'auto-mode-alist '("\\.erl$" . erlang-mode))
