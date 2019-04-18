;;;
;;; Configuration and mode customization for
;;; java and android development
;;;


(defun dm-java-mode-hook ()
  (setq c-basic-offset 4) ; seems to be standard for android
  )

(add-hook 'java-mode-hook 'dm/programming-mode-hook)
(add-hook 'java-mode-hook 'dm-java-mode-hook)
