(use-package helm
  :init
  (progn
    (use-package helm-config)
    (use-package helm-swoop)
    (use-package helm-ls-git)
    (use-package helm-git-grep)
    (use-package helm-ag)
    (use-package helm-helm-commands)
    (use-package helm-flycheck)
    (use-package helm-rails)
    (use-package helm-rb)
    (use-package helm-themes)
    )
  )

;(helm :sources '(helm-source-findutils)
;      :buffer "*helm-findutils*")
