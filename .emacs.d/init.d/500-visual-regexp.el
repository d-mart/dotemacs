(require 'visual-regexp)
;(require 'visual-regexp-steroids)

(define-key global-map (kbd "C-M-%") 'vr/replace)
(define-key global-map (kbd "M-%") 'vr/query-replace)
