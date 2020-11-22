;; Look and feel / environment settings

; Set cursor color to white
(setq dm/cursor-color "#ffffff")
(set-cursor-color dm/cursor-color)

(use-package beacon
  :init
  (beacon-mode 1)
  (setq beacon-push-mark 35)
  (setq beacon-color "#666600"))

(use-package amx
  :bind
  ("M-x" . amx))

(if (eq (window-system) 'ns)
    (use-package ns-auto-titlebar
      :init
      (ns-auto-titlebar-mode)))

;; frame setup
(add-to-list 'default-frame-alist '(fullscreen . maximized))

(defun dm/after-make-frame-advice ()
  (fix-frame-font)
  (set-cursor-color dm/cursor-color)
  (set-frame-parameter nil 'fullscreen 'maximized)
  (scroll-bar-mode -1))

(advice-add 'make-frame-command :after #'dm/after-make-frame-advice)
