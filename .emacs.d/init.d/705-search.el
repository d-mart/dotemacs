;; ----------------
;;
;; ----------------

(use-package ag
  :config
  (setq ag-ignore-list '("\*.log" "\*.tmp"))
  :bind
  ("C-h g" . ag-project-regexp))

;; rgrep - friendly recursive grep function
(global-set-key (kbd "C-c g") 'rgrep)
