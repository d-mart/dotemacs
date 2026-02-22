;; -*- lexical-binding: nil; -*-
;;; ----------------------
;;; Elixir
;;; ----------------------

(defun dm/elixir-mode-keybindings ()
  (define-key elixir-mode-map (kbd "C-c C-c") 'dm/comment-or-uncomment-region)
  (define-key elixir-mode-map (kbd "C-c #")   'dm/comment-or-uncomment-region)
  (define-key elixir-mode-map (kbd "C-c C-d") 'dm/elixir-insert-debugger)
  (define-key elixir-mode-map (kbd "s-p")     'dm/elixir-insert-inspect)
  )

(add-hook 'elixir-mode-hook 'dm/programming-mode-hook)
(add-hook 'elixir-mode-hook 'dm/elixir-mode-keybindings)

(add-to-list 'auto-mode-alist '("mix.lock" . elixir-mode))

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
