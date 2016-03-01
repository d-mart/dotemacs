;; configure ace-isearch
;; regexp search by default
(global-set-key (kbd "C-r")     'isearch-backward-regexp)
(global-set-key (kbd "C-s")     'isearch-forward-regexp)

;; add occur mode to isearch-forward:
;; switch to occur from a search, e.g.
;; C-s foo C-o
(define-key isearch-mode-map (kbd "C-o")
  (lambda ()
    (interactive)
    (let ((case-fold-search isearch-case-fold-search))
      (occur (if isearch-regexp isearch-string
               (regexp-quote isearch-string))))))


(use-package swiper
  :bind
  ("C-M-s" . swiper))

(use-package ace-isearch
  :init
  (progn
    (global-ace-isearch-mode +1) ))
