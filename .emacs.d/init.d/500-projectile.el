(require 'projectile)

(projectile-global-mode)

;; index inn pure elisp, instead of standard unix tools
;(setq project-indexing-method 'native)

;; cache can be dumped with C-u before most proejctile commands
(setq projectile-enable-caching t)

;; custom completion system is also allowed
(setq projectile-completion-system 'ido) ;; ido-flx if enabled
(setq projectile-completion-system 'grizzl)
