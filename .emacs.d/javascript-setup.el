;;; ----------------------
;;; Javascript setup
;;; ----------------------

(defun my-js-settings ()
  (js-indent-level 2))

(add-hook 'js-mode 'my-js-settings)

(setq auto-mode-alist
      (append auto-mode-alist
              '(("\\.js$" . javascript-mode))))
