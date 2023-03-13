;; ----------------
;; Navigation, window/frame/buffer movement and selection
;; ----------------

(use-package bm)

(use-package ace-window) ;;; TODO for some reason the below won't load without this
(use-package ace-window
  :init
  (setq aw-keys '(?1 ?2 ?3 ?4 ?5 ?6 ?7 ?8 ?9 ?0 ?! ?@ ?# ?$ ?% ?% ?^ ?& ?* ?( ?)))
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
   ("M-g p"   . avy-goto-line-above)
   ("M-g M-p" . avy-goto-line-above)
   ("M-g n"   . avy-goto-line-below)
   ("M-g M-n" . avy-goto-line-below)
   ("C-;"     . avy-goto-char)
   ("C-:"     . avy-goto-char-2)
   ("C-'"     . avy-goto-char-timer)))

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

(use-package framemove
  :load-path "plugins"
  :init
  (setq framemove-hook-into-windmove t)
  :config
  (windmove-default-keybindings))

;; add some others to ctrl-z map
(global-set-key (kbd "C-z C-g") 'keyboard-quit)
(global-set-key (kbd "C-z o")   'other-window)
