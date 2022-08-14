;; ----------------
;;
;; ----------------

(use-package deadgrep
  :init
  (setq deadgrep--search-type 'regexp)
  :bind
  ("C-h g" . deadgrep))

;; rgrep - friendly recursive grep function
(global-set-key (kbd "C-c g") 'rgrep)
