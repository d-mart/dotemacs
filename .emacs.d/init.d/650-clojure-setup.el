;;; ----------------------
;;; Clojure
;;; ----------------------
(autoload 'clojure-mode "clojure-mode"
          "Clojure syntax highlighting")

(add-to-list 'auto-mode-alist '("\\.clj$" . clojure-mode))
