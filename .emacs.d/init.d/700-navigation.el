;; ----------------
;; Navigation, window/frame/buffer movement and selection
;; ----------------

(use-package ace-window
  :init
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l)) ; replaces 1 2 3 4 ... for window numbering
  (ace-window-display-mode t)
  :bind
  (("C-x C-o" . ace-window)))

(use-package ace-jump-buffer
  :bind
  (("s-b" . ace-jump-buffer)))

(use-package avy
  :init
  (eval-after-load "isearch" '(define-key isearch-mode-map (kbd "C-'") 'avy-isearch))
  :bind
  (("M-g w"   . avy-goto-word-1)
   ("M-g M-w" . avy-goto-word-1)
   ("M-g e"   . avy-goto-word-0)
   ("M-g M-e" . avy-goto-word-0)
   ("M-g f"   . avy-goto-line)
   ("M-g M-f" . avy-goto-line)
   ("C-:"     . avy-goto-char)
   ("C-'"     . avy-goto-char-2)))

(use-package ggtags
  :init
  (add-hook 'c-mode-hook 'ggtags-mode))

(use-package buffer-move
  :bind
  (("C-S-<up>"    . buf-move-up)
   ("C-S-<down>"  . buf-move-down)
   ("C-S-<left>"  . buf-move-left)
   ("C-S-<right>" . buf-move-right)
   ("C-z h"       . buf-move-left)
   ("C-z j"       . buf-move-down)
   ("C-z k"       . buf-move-up)
   ("C-z l"       . buf-move-right)))
