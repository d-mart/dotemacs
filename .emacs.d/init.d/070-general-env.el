;; Look and feel / environment settings

; Set cursor color to white
(set-cursor-color "#ffffff")

(use-package beacon-mode
  :init
  (beacon-mode 1)
  (setq beacon-push-mark 35)
  (setq beacon-color "#666600"))

(use-package zoom-frm
  :init
  (define-key ctl-x-map (kbd "C-+") 'zoom-in/out)
  (define-key ctl-x-map (kbd "C--") 'zoom-in/out)
  (define-key ctl-x-map (kbd "C-=") 'zoom-in/out)
  (define-key ctl-x-map (kbd "C-0") 'zoom-in/out))

; smex - ido-stuff on M-x
(use-package smex
  :bind
  (("M-x" . smex)
   ("M-X" . smex-major-mode-commands)))
