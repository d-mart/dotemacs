;; ----------------
;;
;; ----------------

(use-package deadgrep
  :init
  (setq deadgrep--search-type 'regexp)
  :bind
  ("C-h G" . deadgrep))

;; rgrep - friendly recursive grep function
(global-set-key (kbd "C-c g") 'rgrep)

;; use any available grep-like tool
;; https://github.com/jimporter/urgrep
(use-package urgrep
  :init
  (setq urgrep-search-regexp t)
  :bind
  ("C-h g" . urgrep))
