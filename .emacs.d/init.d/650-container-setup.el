;;; ----------------------
;;; docker, kube, etc setup
;;; ----------------------
(use-package dockerfile-mode)

(defun dm/dockerfile-mode-hook ()
  )

(add-hook 'dockerfile-mode-hook 'dm/programming-mode-hook)
(add-hook 'dockerfile-mode-hook 'dm/dockerfile-mode-hook)
