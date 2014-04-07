;;
;; Folding, hiding, highlighting, deleting lines
;;

(defun dm-delete-matching-lines ()
  (interactive)
  (read-only-mode 0)
  (call-interactively 'flush-lines))

(defalias 'delete-matching-lines 'dm-delete-matching-lines)
(defalias 'dl                    'dm-delete-matching-lines)
(defalias 'ttl                   'toggle-truncate-lines)
(defalias 'ww                    'toggle-truncate-lines)

;; ace-jump-mode - type hotkey and a letter, buffer shows enumerated choice
;; of which instance of that char to jump to
(use-package ace-jump-mode
  :bind (("C-x l" . ace-jump-mode)
         ("C-x L" . ace-jump-line-mode)))

;; hide lines that match or don't match a regex
(use-package hide-lines
  :bind ("C-c /"  . hide-lines))
