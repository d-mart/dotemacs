(use-package smartparens
  :init
  (progn
    (require 'smartparens-config)
    (setq sp-highlight-pair-overlay nil)
    (smartparens-global-mode 1)))
