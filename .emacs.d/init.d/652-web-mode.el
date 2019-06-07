;;; ----------------------
;;; Web Temaplate editing
;;; ----------------------

;; Lots of customization options and info here: http://web-mode.org/

(use-package web-mode
  :init
  (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
  :custom
  (web-mode-markup-indent-offset 2 "4 spaces good, 2 spaces better")
  (web-mode-css-indent-offset    2 "2 spaces")
  (web-mode-code-indent-offset   2 "2 spaces")
  (web-mode-enable-current-column-highlight  t)
  (web-mode-enable-current-element-highlight t)
  (web-mode-extra-auto-pairs
    '(("erb"  . (("beg" "end")))
     ))
  )
