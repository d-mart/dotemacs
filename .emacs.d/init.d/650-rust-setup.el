;;; ----------------------
;;; Rust
;;; ----------------------
(add-hook 'rust-mode-hook 'my-programming-mode-hook)

(add-to-list 'auto-mode-alist '("\\.rust$" . rust-mode))
