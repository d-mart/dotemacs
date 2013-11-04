;; customization stuff made by emacs's customization UI

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ahk-syntax-directory "~/.emacs.d/plugins/ahk-mode-support/")
 '(ansi-color-names-vector
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#ad7fa8" "#8cc4ff" "#eeeeec"])
 '(aquamacs-customization-version-id 0 t)
 '(browse-url-browser-function (quote browse-url-firefox))
 '(custom-enabled-themes (quote (tango-dark)))
 '(custom-safe-themes
   (quote
    ("60e70079a187df634db25db4bb778255eaace1ef4309e56389459fb9418b4840" "1c1e6b2640daffcd23b1f7dd5385ca8484a060aec901b677d0ec0cf2927f7cde" "65e05a8630f98308e8e804d3bbc0232b02fe2e8d24c1db358479a85f3356198d" "6e35fcaa342a44064d869940a0b67c409f2150e94dde39e16bd2bd9496629742" "ea0c5df0f067d2e3c0f048c1f8795af7b873f5014837feb0a7c8317f34417b04" "d1fd8fc0f54f6a1d2905eb0a914bc479486680a028b0964cd87f232309b786c5" "dd00495c188318c11cb8469a88254d080f9e8ba65cf105de05e6e1ee1aa88c69" "ffbc43cd2b8c0f11d6093575bd9b34fa95cdc1366939d37aef309b7d90b340fe" "cfde97b1d5ed1770b8e2e1b739611820c3a3e370cbda75d96e78ef2a5f359b27" "be7eadb2971d1057396c20e2eebaa08ec4bfd1efe9382c12917c6fe24352b7c1" "71efabb175ea1cf5c9768f10dad62bb2606f41d110152f4ace675325d28df8bd" "37ef3ff16a63e2732cb2ac3a43a319cb6c70c5069d33db82f6c4758ee2299a94" "36afe64261e1de73fcfadedf154e4bc2c9ec1969bde0c21798d31366897bc4d2" default)))
 '(debug-on-error nil)
 '(ediff-diff-options "-w" t)
 '(fci-rule-color "#383838")
 '(fringe-mode (quote (0)) nil (fringe))
 '(hl-paren-colors
   (quote
    ("firebrick1" "DarkOrange2" "yellow3" "green2" "blue1" "DarkOrchid3")))
 '(icicle-mode t)
 '(indicate-buffer-boundaries (quote right))
 '(indicate-empty-lines t)
 '(remote-shell-program "ssh")
 '(speedbar-supported-extension-expressions
   (quote
    (".wy" ".by" ".[ch]\\(\\+\\+\\|pp\\|c\\|h\\|xx\\)?" ".tex\\(i\\(nfo\\)?\\)?" ".el" ".emacs" ".l" ".lsp" ".p" ".java" ".f\\(90\\|77\\|or\\)?" ".ada" ".p[lm]" ".tcl" ".m" ".scm" ".pm" ".py" ".g" ".s?html" ".ma?k" "[Mm]akefile\\(\\.in\\)?" ".feature" "Rakefile" ".rb" ".yml")))
 '(term-buffer-maximum-size 0))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(bm-face ((t (:background "gray20" :box (:line-width 2 :color "DeepSkyBlue1" :style released-button)))))
 '(bm-fringe-face ((t (:box (:line-width 2 :color "DeepSkyBlue1" :style released-button)))))
 '(diff-added ((t (:foreground "#99cc99"))))
 '(diff-context ((t (:inherit diff-changed :foreground "LightGoldenrod3"))))
 '(diff-hunk-header ((t (:background "#393939" :foreground "#6699cc"))))
 '(diff-indicator-added ((t (:inherit diff-removed :foreground "Green"))))
 '(diff-indicator-removed ((t (:inherit diff-removed :foreground "Red"))))
 '(diff-removed ((t (:foreground "#f2777a"))))
 '(flx-highlight-face ((t (:inherit font-lock-variable-name-face :foreground "deep sky blue" :underline t :weight semi-bold))))
 '(font-lock-punctuation ((t (:inherit diff-changed :foreground "plum1"))) t)
 '(fringe ((t (:background "#393939"))))
 '(hl-line ((t (:inherit nil :background "black"))))
 '(linum-highlight-face ((t (:inherit default :foreground "yellow1"))))
 '(magit-diff-file-header ((t (:inherit diff-file-header :foreground "sienna2"))))
 '(magit-header ((t (:inherit header-line :foreground "VioletRed2"))))
 '(magit-item-highlight ((t nil)))
 '(magit-section-title ((t (:inherit magit-header :foreground "DeepSkyBlue1"))))
 '(show-paren-match ((t (:background "#6699cc" :foreground "#393939")))))

;; don't disable narrow-to-region
(put 'narrow-to-region 'disabled nil)
