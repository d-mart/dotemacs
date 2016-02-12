(use-package projectile
  :init
  ((setq projectile-enable-caching t)
   ;(setq projectile-completion-system 'ido) ;; ido-flx if enabled
   (setq projectile-completion-system 'grizzl))
  :config
  ((projectile-global-mode)))

(require 'projectile)

(projectile-global-mode)

;; index inn pure elisp, instead of standard unix tools
; (setq project-indexing-method 'native)
;; cache can be dumped with C-u before most proejctile commands
