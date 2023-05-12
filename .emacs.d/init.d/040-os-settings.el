;;;------------------
;;; Operating System-Dependent Configuration
;;;------------------

(if (eq system-type 'darwin)
    (progn
      (setq ns-function-modifier 'hyper)
      (setq mac-command-modifier 'super)
      (setq mac-option-modifier  'meta)
      (toggle-menu-bar-mode-from-frame)))

(if (eq window-system 'ns)
    ;;something for OS X if true
    ; workaround for having trouble with colors on OSX
    (setq x-colors (ns-list-colors))

   ;; optional something if not
)
