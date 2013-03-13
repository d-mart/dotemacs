;; customization stuff made by emacs's customization UI

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ahk-syntax-directory "~/.emacs.d/plugins/ahk-mode-support/")
 '(browse-url-browser-function (quote browse-url-firefox))
 '(custom-enabled-themes (quote (tango-dark)))
 '(custom-safe-themes (quote ("cfde97b1d5ed1770b8e2e1b739611820c3a3e370cbda75d96e78ef2a5f359b27" "be7eadb2971d1057396c20e2eebaa08ec4bfd1efe9382c12917c6fe24352b7c1" "71efabb175ea1cf5c9768f10dad62bb2606f41d110152f4ace675325d28df8bd" "37ef3ff16a63e2732cb2ac3a43a319cb6c70c5069d33db82f6c4758ee2299a94" "36afe64261e1de73fcfadedf154e4bc2c9ec1969bde0c21798d31366897bc4d2" default)))
 '(debug-on-error nil)
 '(ediff-diff-options "-w" t)
 '(fringe-mode (quote (0)) nil (fringe))
 '(hl-paren-colors (quote ("firebrick1" "DarkOrange2" "yellow3" "green2" "blue1" "DarkOrchid3")))
 '(icicle-mode t)
 '(indicate-buffer-boundaries (quote right))
 '(indicate-empty-lines t)
 '(remote-shell-program "ssh")
 '(speedbar-supported-extension-expressions (quote (".wy" ".by" ".[ch]\\(\\+\\+\\|pp\\|c\\|h\\|xx\\)?" ".tex\\(i\\(nfo\\)?\\)?" ".el" ".emacs" ".l" ".lsp" ".p" ".java" ".f\\(90\\|77\\|or\\)?" ".ada" ".p[lm]" ".tcl" ".m" ".scm" ".pm" ".py" ".g" ".s?html" ".ma?k" "[Mm]akefile\\(\\.in\\)?" ".feature" "Rakefile" ".rb" ".yml")))
 '(term-buffer-maximum-size 0))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(bm-face ((t (:background "gray20" :box (:line-width 2 :color "DeepSkyBlue1" :style released-button)))))
 '(bm-fringe-face ((t (:box (:line-width 2 :color "DeepSkyBlue1" :style released-button)))))
 '(diff-added ((t (:foreground "#99cc99"))) t)
 '(diff-context ((t (:inherit diff-changed :foreground "LightGoldenrod3"))) t)
 '(diff-hunk-header ((t (:background "#393939" :foreground "#6699cc"))) t)
 '(diff-indicator-added ((t (:inherit diff-removed :foreground "Green"))) t)
 '(diff-indicator-removed ((t (:inherit diff-removed :foreground "Red"))) t)
 '(diff-removed ((t (:foreground "#f2777a"))) t)
 '(font-lock-punctuation ((t (:inherit diff-changed :foreground "plum1"))) t)
 '(fringe ((t (:background "#393939"))))
 '(magit-diff-file-header ((t (:inherit diff-file-header :foreground "sienna2"))) t)
 '(magit-header ((t (:inherit header-line :foreground "VioletRed2"))) t)
 '(magit-item-highlight ((t (:foreground "DeepSkyBlue1"))) t)
 '(show-paren-match ((t (:background "#6699cc" :foreground "#393939")))))

;; don't disable narrow-to-region
(put 'narrow-to-region 'disabled nil)
