;;; ----------------------
;;; Go
;;; ----------------------

(add-hook 'go-mode-hook 'dm/programming-mode-hook)

(add-to-list 'auto-mode-alist '("\\.go$" . go-mode))
