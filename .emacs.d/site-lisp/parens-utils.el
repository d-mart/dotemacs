;;; parens-utils.el
;; utilities for making two paren packaages play nicely together
;; drawn heavily (totally?) from http://www.emacswiki.org/emacs/HighlightParentheses


;; This thing seems to suck
;; make autopair and highlight-parentheses-mode work together
;(add-hook 'highlight-parentheses-mode-hook
;          '(lambda ()
;             (setq autopair-handle-action-fns
;                   (append
;					(if autopair-handle-action-fns
;						autopair-handle-action-fns
;					  '(autopair-default-handle-action))
;					'((lambda (action pair pos-before)
;						(hl-paren-color-update)))))))

;; Enable highlight-parentheses minor mode globally in all buffers
(define-globalized-minor-mode global-highlight-parentheses-mode
  highlight-parentheses-mode
  (lambda ()
    (highlight-parentheses-mode t)))
(global-highlight-parentheses-mode t)
;;(global-highlight-parentheses-mode nil)


(defun goto-match-paren (arg)
  "Go to the matching parenthesis if on parenthesis AND last command is a movement command, otherwise insert %.
  vi style of % jumping to matching brace."
  (interactive "p")
  (message "%s" last-command)
  (if (not (memq last-command '(
                                set-mark
                                cua-set-mark
                                goto-match-paren
                                down-list
                                up-list
                                end-of-defun
                                beginning-of-defun
                                backward-sexp
                                forward-sexp
                                backward-up-list
                                forward-paragraph
                                backward-paragraph
                                end-of-buffer
                                beginning-of-buffer
                                backward-word
                                forward-word
                                mwheel-scroll
                                backward-word
                                forward-word
                                mouse-start-secondary
                                mouse-yank-secondary
                                mouse-secondary-save-then-kill
                                move-end-of-line
                                move-beginning-of-line
                                backward-char
                                forward-char
                                scroll-up
                                scroll-down
                                scroll-left
                                scroll-right
                                mouse-set-point
                                next-buffer
                                previous-buffer
                                )
                 ))
      (self-insert-command (or arg 1))
    (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
          ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
          (t (self-insert-command (or arg 1))))))

