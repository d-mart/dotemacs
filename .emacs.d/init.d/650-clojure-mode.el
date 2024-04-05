;;;
;;; Configuration and mode customization clojure and edn
;;;

(use-package clojure-mode)

(defun dm/clojure-mode-keykindings ()
  (define-key clojure-mode-map (kbd "C-c C-c") 'comment-or-uncomment-region)
  (define-key clojure-mode-map (kbd "C-c #")   'comment-or-uncomment-region))

(defun dm/clojure-mode-hook ())

(add-hook 'clojure-mode-hook 'dm/programming-mode-hook)
(add-hook 'clojure-mode-hook 'dm/clojure-mode-hook)
(add-hook 'clojure-mode-hook 'dm/clojure-mode-keykindings)

(add-to-list 'auto-mode-alist '("\\.clojure$" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.edn$"     . clojure-mode))
