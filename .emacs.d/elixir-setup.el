;;; ----------------------
;;; Elixir
;;; ----------------------

(defun dm/elixir-settings ()
  (alchemist-mode t)
  (message "loaded dm/elixir-settings"))

(defun dm/elixir-mode-keybindings ()
  (define-key elixir-mode-map (kbd "C-c C-c") 'comment-or-uncomment-region)
  (define-key elixir-mode-map (kbd "C-c #")   'comment-or-uncomment-region)
  (define-key elixir-mode-map (kbd "C-c C-d") 'dm/elixir-insert-debugger)
  (define-key elixir-mode-map (kbd "s-p")     'dm/elixir-insert-inspect)
  )

(add-hook 'elixir-mode-hook 'my-programming-mode-hook)
(add-hook 'elixir-mode-hook 'dm/elixir-settings)
(add-hook 'elixir-mode-hook 'dm/elixir-mode-keybindings)

(defun dm/elixir-insert-debugger ()
  (interactive)
  (beginning-of-line)
  (open-line 1)
  (insert "require IEx; IEx.pry # XXXXXXXXXXXXXXXXXXXXXXXXXXX"))

(defun dm/elixir-insert-inspect ()
  (interactive)
  (end-of-line)
  (newline-and-indent)
  (insert "|> IO.inspect # XXXXXXXXXXXXXXXXXXXXXXXXXXX"))

(use-package alchemist
  :init
  (progn
    ))
