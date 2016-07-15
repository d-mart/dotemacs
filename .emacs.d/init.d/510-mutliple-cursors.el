
(use-package multiple-cursors
  :init

  :config

  :bind (("C-S-c C-S-c" . mc/edit-lines)  ; this collides with C-c C-c comment-or-uncomment-region
         ("C->"         . mc/mark-next-like-this)
         ("C-<"         . mc/mark-previous-like-this)
         ("C-c C-<"     . mc/mark-all-like-this)
         ("C-S-="       . mc/mark-more-like-this))
  )
