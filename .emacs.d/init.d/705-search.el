;; ----------------
;;
;; ----------------

(use-package ag
  :disabled ;; trying deadgrep for a bit
  :config
  (setq ag-ignore-list '("\*.log" "\*.tmp"))
  :bind
  ("C-h g" . ag-project-regexp))

(use-package deadgrep
  :config
  (setq deadgrep--search-type 'regex)
  :bind
  ("C-h g" . deadgrep))


;; rgrep - friendly recursive grep function
(global-set-key (kbd "C-c g") 'rgrep)
