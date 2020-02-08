;;;
;;; Configuration and mode customization for python
;;;

;; python-mode keybindings
(defun dm/python-mode-keybindings ()
  (define-key python-mode-map (kbd "C-c C-c") 'comment-or-uncomment-region)
  (define-key python-mode-map (kbd "C-c C-d") 'dm/python-insert-debugger))

(add-hook 'python-mode-hook 'dm/programming-mode-hook)
(add-hook 'python-mode-hook 'dm/python-mode-keybindings)
(add-hook 'python-mode-hook 'fontify-at-todo)

(defun dm/python-insert-debugger ()
  (interactive)
  (beginning-of-line)
  (open-line 1)
  (indent-for-tab-command)
  (insert "import pdb; pdb.set_trace() #XXXXXXXXXXXXXXXXXX")
  )
