(if t
  (message "helm disabled for now")
  (use-package helm
    :init
    (progn
      (use-package helm-ag)
      (use-package helm-config)
      (use-package helm-flycheck)
      (use-package helm-git-grep)
      (use-package helm-helm-commands)
      (use-package helm-ls-git)
      (use-package helm-projectile)
      (use-package helm-projectile-rails)
      (use-package helm-rb)
      (use-package helm-themes)
      ;; (use-package helm-tags
      ;;   :init
      ;;   ((add-hook 'c-mode-hook 'helm-gtags-mode)
      ;;    (define-key helm-gtags-mode-map (kbd "M-t")     'helm-gtags-find-tag)
      ;;    (define-key helm-gtags-mode-map (kbd "M-r")     'helm-gtags-find-rtag)
      ;;    (define-key helm-gtags-mode-map (kbd "M-s")     'helm-gtags-find-symbol)
      ;;    (define-key helm-gtags-mode-map (kbd "M-g M-p") 'helm-gtags-parse-file)
      ;;    (define-key helm-gtags-mode-map (kbd "C-c <")   'helm-gtags-previous-history)
      ;;    (define-key helm-gtags-mode-map (kbd "C-c >")   'helm-gtags-next-history)
      ;;    (define-key helm-gtags-mode-map (kbd "M-,")     'helm-gtags-pop-stack)))
      (use-package ace-jump-helm-line
        :init
        (eval-after-load "helm"
          '(define-key helm-map (kbd "C-'") 'ace-jump-helm-line)))

      (helm-mode t)
      )))

                                        ;(helm :sources '(helm-source-findutils)
                                        ;      :buffer "*helm-findutils*")
