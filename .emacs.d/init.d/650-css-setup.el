;;; ----------------------
;;; CSS / SASS setup
;;; ----------------------

;(add-to-list 'auto-mode-alist '("\\.ext$" . -mode))

(use-package emmet-mode
  :init
  (add-hook 'css-mode-hook 'emmet-mode)
  )
