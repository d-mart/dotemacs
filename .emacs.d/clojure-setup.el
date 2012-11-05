;;; ----------------------
;;; Clojure
;;; ----------------------
(autoload 'clojure-mode "clojure-mode"
          "Clojure syntax highlighting")

(append '(("\\.clj$"      . clojure-mode))
        auto-mode-alist)
