;; ----------------
;; Navigation, window/frame/buffer movement and selection
;; ----------------

(use-package 0blayout
  :init
  (0blayout-mode))

(use-package bm)

(use-package ace-window
  :init
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l)) ; replaces 1 2 3 4 ... for window numbering
  (ace-window-display-mode t)
  :bind
  (("C-x C-o" . ace-window)
   ("C-x C-p" . aw-flip-window)))

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
   ("M-g g"   . avy-goto-line) ; avy-goto-line also duplicates standard...
   ("M-g M-g" . avy-goto-line) ; ... goto-line number functionality
   ("C-:"     . avy-goto-char)
   ("C-'"     . avy-goto-char-2)))

;(use-package ggtags
;  :init
;  (add-hook 'c-mode-hook 'ggtags-mode)
;  :bind (:map ggtags-navigation-mode-map
;           ("\M-<" . ggtags-navigation-mode-map )
;           ("\M->" . ggtags-navigation-mode-map )))

(use-package buffer-move
 :bind
 (("C-z C-h"     . buf-move-left)
  ("C-z C-j"     . buf-move-down)
  ("C-z C-k"     . buf-move-up)
  ("C-z C-l"     . buf-move-right)
  ("C-z h"       . windmove-left)
  ("C-z j"       . windmove-down)
  ("C-z k"       . windmove-up)
  ("C-z l"       . windmove-right)))

;; add some others to ctrl-z map
(global-set-key (kbd "C-z C-g") 'keyboard-quit)
(global-set-key (kbd "C-z o")   'other-window)
