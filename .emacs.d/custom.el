;; customization stuff made by emacs's customization UI

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ahk-syntax-directory "~/.emacs.d/plugins/ahk-mode-support/")
 '(browse-url-browser-function (quote browse-url-firefox))
 '(custom-enabled-themes (quote (tango-dark)))
 '(custom-safe-themes (quote ("be7eadb2971d1057396c20e2eebaa08ec4bfd1efe9382c12917c6fe24352b7c1" "71efabb175ea1cf5c9768f10dad62bb2606f41d110152f4ace675325d28df8bd" "37ef3ff16a63e2732cb2ac3a43a319cb6c70c5069d33db82f6c4758ee2299a94" "36afe64261e1de73fcfadedf154e4bc2c9ec1969bde0c21798d31366897bc4d2" default)))
 '(debug-on-error t)
 '(ediff-diff-options "-w")
 '(hl-paren-colors (quote ("firebrick1" "DarkOrange2" "yellow3" "green2" "blue1" "DarkOrchid3")))
 '(icicle-mode t)
 '(remote-shell-program "ssh")
 '(speedbar-supported-extension-expressions (quote (".wy" ".by" ".[ch]\\(\\+\\+\\|pp\\|c\\|h\\|xx\\)?" ".tex\\(i\\(nfo\\)?\\)?" ".el" ".emacs" ".l" ".lsp" ".p" ".java" ".f\\(90\\|77\\|or\\)?" ".ada" ".p[lm]" ".tcl" ".m" ".scm" ".pm" ".py" ".g" ".s?html" ".ma?k" "[Mm]akefile\\(\\.in\\)?" ".feature" "Rakefile" ".rb" ".yml")))
 '(term-buffer-maximum-size 0))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(diff-added ((t (:inherit diff-changed :foreground "forest green"))))
 '(diff-context ((t (:inherit diff-changed :foreground "LightGoldenrod3"))))
 '(diff-hunk-header ((t (:inherit diff-changed :foreground "Purple"))))
 '(diff-indicator-added ((t (:inherit diff-removed :foreground "Green"))))
 '(diff-indicator-removed ((t (:inherit diff-removed :foreground "Red"))))
 '(diff-removed ((t (:inherit diff-changed :foreground "red3"))))
 '(font-lock-punctuation ((t (:inherit diff-changed :foreground "plum1"))) t)
 '(magit-diff-file-header ((t (:inherit diff-file-header :foreground "sienna2"))))
 '(magit-header ((t (:inherit header-line :foreground "VioletRed2"))))
 '(magit-item-highlight ((t (:foreground "DeepSkyBlue1"))))
 '(show-paren-match ((t (:strike-through "Cyan" :underline "DeepSkyBlue2" :weight bold)))))

;; don't disable narrow-to-region
(put 'narrow-to-region 'disabled nil)
