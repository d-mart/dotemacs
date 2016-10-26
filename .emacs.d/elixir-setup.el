;;; ----------------------
;;; Elixir
;;; ----------------------

(defun dm/elixir-settings ()
  (alchemist-made t)
  (message "loaded dm/elixir-settings"))

(defun dm/elixir-mode-keybindings ()
  (define-key elixir-mode-map (kbd "C-c C-c") 'comment-or-uncomment-region)
  (define-key elixir-mode-map (kbd "C-c #")   'comment-or-uncomment-region)
  (define-key elixir-mode-map (kbd "C-c C-d") 'dm/elixir-insert-debugger))

(add-hook 'elixir-mode-hook 'my-programming-mode-hook)
(add-hook 'elixir-mode-hook 'dm/elixir-settings)
(add-hook 'elixir-mode-hook 'dm/elixir-mode-keybindings)

(defun dm/elixir-insert-debugger ()
  (interactive)
  (beginning-of-line)
  (open-line 1)
  (insert "require IEx; IEx.pry # XXXXXXXXXXXXXXXXXXXXXXXXXXX"))

(use-package alchemist
  :init
  (progn
    ))
