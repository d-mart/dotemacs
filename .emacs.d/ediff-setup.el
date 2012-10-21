;;;------------------
;;; ediff setup
;;;------------------

; ignore whitespace
(setq ediff-diff-options "-w")
; diff side-by-side isntead of over-and-under
(setq ediff-split-window-function (quote split-window-horizontally))
; hide little popup window
(setq ediff-window-setup-function (quote ediff-setup-windows-plain))

