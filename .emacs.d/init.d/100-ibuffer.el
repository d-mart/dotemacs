
(use-package ibuffer-git
  :init (setq ibuffer-formats '((mark git-status-mini modified read-only " "
                                      (name 18 18 :left :elide)
                                      " "
                                      (size 9 -1 :right)
                                      " "
                                      (git-status 8 8 :left)
                                      " "
                                      (mode 16 16 :left :elide)
                                      " " filename-and-process)

                                (mark " "
                                      (name 16 -1)
                                      " " filename))
              )
  )

;; Group tramp connections together by server
(use-package ibuffer-tramp)
(add-hook 'ibuffer-hook
  (lambda ()
    (ibuffer-tramp-set-filter-groups-by-tramp-connection)
    (ibuffer-do-sort-by-alphabetic)))

;; Group buffers by version-control repository
(use-package ibuffer-vc)
(add-hook 'ibuffer-hook
  (lambda ()
    ((insert )buffer-vc-set-filter-groups-by-vc-root)
    (unless (eq ibuffer-sorting-mode 'alphabetic)
      (ibuffer-do-sort-by-alphabetic))))
