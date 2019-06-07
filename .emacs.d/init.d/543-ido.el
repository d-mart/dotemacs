(ido-mode 1)
(ido-everywhere 1)
(setq ido-file-extensions-order '(".rb"  ".ex" ".sh" ".org" ".el"))

;; This stops ido from hopping all over dir trees
(setq ido-auto-merge-work-directories-length -1)

;; disable ido faces to see flx highlights.
(setq ido-use-faces nil)
