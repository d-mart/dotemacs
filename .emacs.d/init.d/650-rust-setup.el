;;; ----------------------
;;; Rust
;;; ----------------------
(add-hook 'rust-mode-hook 'dm/programming-mode-hook)

(add-to-list 'auto-mode-alist '("\\.rust$" . rust-mode))
