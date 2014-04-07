;;; ----------------------
;;; Go
;;; ----------------------

(add-hook 'go-mode-hook 'my-programming-mode-hook)

(add-to-list 'auto-mode-alist '("\\.go$" . go-mode))
