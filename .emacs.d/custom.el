;; customization stuff made by emacs's customization UI

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(Linum-format "%7i ")
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-term-color-vector
   [unspecified "#FFFFFF" "#d15120" "#5f9411" "#d2ad00" "#6b82a7" "#a66bab" "#6b82a7" "#505050"] t)
 '(beacon-color "#ec4780")
 '(company-quickhelp-color-background "#4F4F4F")
 '(company-quickhelp-color-foreground "#DCDCCC")
 '(compilation-message-face (quote default))
 '(custom-enabled-themes (quote (darkokai)))
 '(custom-safe-themes
   (quote
    ("3a3de615f80a0e8706208f0a71bbcc7cc3816988f971b6d237223b6731f91605" "5d3e0746023fc5e246eb3e0e48c1ccb5ce0387fc4273896c6cf02ee349c2eba8" "748d0e2ffdaf95015a539dcc95ab888283284ad7b076963760422cbe5e21903a" "d61fc0e6409f0c2a22e97162d7d151dee9e192a90fa623f8d6a071dbf49229c6" "8891c81848a6cf203c7ac816436ea1a859c34038c39e3cf9f48292d8b1c86528" "e11569fd7e31321a33358ee4b232c2d3cf05caccd90f896e1df6cab228191109" "a3fa4abaf08cc169b61dea8f6df1bbe4123ec1d2afeb01c17e11fdc31fc66379" "ecba61c2239fbef776a72b65295b88e5534e458dfe3e6d7d9f9cb353448a569e" "6350f0cf3091e574a5de01d7309c0b456d814756a79867eac02c11b262d04a2e" "aae95fc700f9f7ff70efbc294fc7367376aa9456356ae36ec234751040ed9168" "0e33022384e4db1374827f51e3d9e9a2d56282c2e3568c22f1c12ad80e20cf0c" "4697a2d4afca3f5ed4fdf5f715e36a6cac5c6154e105f3596b44a4874ae52c45" "5f4e4c9f5de8156f964fdf8a1b8f8f659efbfeff88b38f49ce13953a84272b77" "2941526f0165b681482a7bfe61b071db10c6df090d04a530c593254ea6412054" "3b0a350918ee819dca209cec62d867678d7dac74f6195f5e3799aa206358a983" "d600c677f1777c1e4bfb066529b5b73c0179d0499dd4ffa3f599a0fb0cfbd501" "408e753da5ce585ad73a0388b50749ef4dcf2b047583fb1378516576e40fa71b" "82b67c7e21c3b12be7b569af7c84ec0fb2d62105629a173e2479e1053cff94bd" "a24c5b3c12d147da6cef80938dca1223b7c7f70f2f382b26308eba014dc4833a" "15348febfa2266c4def59a08ef2846f6032c0797f001d7b9148f30ace0d08bcf" "5a0eee1070a4fc64268f008a4c7abfda32d912118e080e18c3c865ef864d1bea" "365d9553de0e0d658af60cff7b8f891ca185a2d7ba3fc6d29aadba69f5194c7f" "6ee6f99dc6219b65f67e04149c79ea316ca4bcd769a9e904030d38908fd7ccf9" default)))
 '(debug-on-error nil)
 '(diary-entry-marker (quote font-lock-variable-name-face))
 '(ediff-diff-options "-w" t)
 '(fci-rule-character-color "#d9d9d9")
 '(frame-background-mode (quote dark))
 '(frame-brackground-mode (quote dark))
 '(fringe-mode (quote (0)) nil (fringe))
 '(global-git-commit-mode t)
 '(highlight-changes-colors (quote ("#ff8eff" "#ab7eff")))
 '(highlight-indent-guides-auto-enabled nil)
 '(highlight-symbol-colors
   (quote
    ("#FFEE58" "#C5E1A5" "#80DEEA" "#64B5F6" "#E1BEE7" "#FFCC80")))
 '(highlight-symbol-foreground-color "#E0E0E0")
 '(highlight-tail-colors
   (quote
    (("#424748" . 0)
     ("#63de5d" . 20)
     ("#4BBEAE" . 30)
     ("#1DB4D0" . 50)
     ("#9A8F21" . 60)
     ("#A75B00" . 70)
     ("#F309DF" . 85)
     ("#424748" . 100))))
 '(hl-paren-background-colors (quote ("#2492db" "#95a5a6" nil)))
 '(hl-paren-colors
   (quote
    ("firebrick1" "DarkOrange2" "yellow3" "green2" "blue1" "DarkOrchid3")))
 '(indicate-buffer-boundaries (quote right))
 '(indicate-empty-lines t)
 '(js-indent-level 2)
 '(js2-basic-offset 2)
 '(js2-bounce-indent-p nil)
 '(js2-highlight-level 3)
 '(js2-mode-indent-ignore-first-tab t)
 '(magit-diff-use-overlays nil)
 '(magit-log-arguments (quote ("--color" "--decorate" "-n256")))
 '(magit-use-overlays nil)
 '(main-line-color1 "#1E1E1E")
 '(main-line-color2 "#111111")
 '(main-line-separator-style (quote chamfer))
 '(nrepl-message-colors
   (quote
    ("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(package-selected-packages
   (quote
    (ess deadgrep doom-modeline all-the-icons-dired "amx" package-build shut-up epl git commander f dash s ivy-yasnippet load-env-vars nova-theme ob-elixir ob-restclient graphviz-dot-mode dired-filter dired-narrow dired-subtree rg swoop magit elcontext panda-theme sequential-command smart-jump projectile-rails yasnippet-snippets zenburn-theme counsel-projectile dotenv-mode scp docker docker-compose-mode docker-tramp chronos dumb-diff pocket-reader buffer-watcher nov org-web-tools winnow x509-mode bind-chord ido-completing-read+ amx org2web vc-msg crux isend-mode gist face-explorer paredit find-file-in-project fzf org-sticky-header groovy-mode navi-mode viewer vmd-mode nimbus-theme company async-await fuff madhat2r-theme markdown-edit-indirect markdown-preview-eww markdown-preview-mode melancholy-theme zweilight-theme distinguished-theme gratuitous-dark-theme gruber-darker-theme kooten-theme rust-playground winum plantuml-mode apib-mode elmacro darkane-theme erlang emacs-profiles webpaste 0xc direnv dkl ripgrep counsel-dash doom-themes monitor cmake-mode better-shell pcap-mode transfer-sh eshell-autojump which-key f3 forest-blue-theme gotham-theme darkokai-theme moonscript redtick helm-c-moccur moccur-edit counsel ace-mc dark-mint-theme try buffer-move ggtags helm-gtags dumb-jump omtose-phellack-theme fireplace firestarter flycheck-clangcheck comment-dwim-2 zzz-to-char zone-rainbow elixir-yasnippets sublime-themes sift highlight-indent-guides code-library darcula-theme dark-krystal-theme darkburn-theme slim-mode termbright-theme pastelmac-theme helm-grepint helm-fuzzier bpr jenkins beacon abyss-theme emacsql-mysql scratches tab-jump-out use-package-chords subemacs smart-region w3m atom-one-dark-theme atom-dark-theme skewer-mode async ahungry-theme org-wunderlist org-sync aurora-theme color-moccur emacsql turnip emamux zerodark-theme kaesar-mode kaesar-file kaesar dart-mode rainbow-mode alchemist alect-themes ample-theme ample-zen-theme eshell-prompt-extras eshell-z fasd eno auto-complete peek-mode ace-window pomodoro protobuf-mode recompile-on-save help-mode+ help-fns+ redis package-safe-delete corral elixir-mode planet-theme racket-mode zonokai-theme avy multi-term marcopolo kerl rpn-calc highlight-indentation apropospriate-theme mellow-theme moe-theme darktooth-theme material-theme ztree zen-and-art-theme yari wgrep warm-night-theme visual-regexp-steroids vagrant twilight-theme twilight-bright-theme twilight-anti-bright-theme toxi-theme subatomic256-theme string-utils spacegray-theme soothe-theme sml-modeline seti-theme scss-mode rvm ruby-tools ruby-interpolation ruby-block rspec-mode roguel-ike reverse-theme rainbow-delimiters railscasts-theme phoenix-dark-pink-theme phi-search-mc phi-search-dired phi-grep peep-dired pallet noccur neotree naquadah-theme move-line molokai-theme mode-line-debug mc-extras math-at-point markdown-mode+ mark-multiple mark-more-like-this magit-push-remote lush-theme lua-mode lfe-mode key-chord jg-quicknav jabber ir-black-theme impatient-mode iflipb iedit ibuffer-vc ibuffer-tramp ibuffer-git hlinum highlight-parentheses highlight-numbers hide-lines heroku-theme helm-projectile-all haste haml-mode hackernews guru-mode grandshell-theme go-mode gitignore-mode gitconfig-mode git-timemachine git-messenger free-keys flx-ido flatui-theme firebelly-theme fiplr feature-mode expand-region etags-select es-lib elisp-slime-nav edts easy-kill dockerfile-mode dired+ darkmine-theme dark-souls cycle-resize cyberpunk-theme coffee-mode browse-kill-ring bm awk-it auto-yasnippet auto-indent-mode auto-complete-etags anti-zenburn-theme android-mode ag afternoon-theme ace-jump-buffer ace-isearch use-package undo-tree smartparens ruby-electric restclient rake powerline pivotal-tracker org-brain monokai-theme magit-popup log4e json-snatcher json-reformat json-mode js2-mode inflections inf-ruby hydra gntp git-commit emojify diminish circe alert)))
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
 '(pos-tip-background-color "#E6DB74")
 '(pos-tip-foreground-color "#242728")
 '(powerline-color1 "#1E1E1E")
 '(powerline-color2 "#111111")
 '(remote-shell-program "ssh")
 '(safe-local-variable-values
   (quote
    ((ffip-project-root . "/Users/dmartinez/proj/intelliconnect/")
     (ffip-find-options . "-not -regex '.*beam'"))))
 '(sml-modeline-mode t)
 '(sml/active-background-color "#34495e")
 '(sml/active-foreground-color "#ecf0f1")
 '(sml/inactive-background-color "#dfe4ea")
 '(sml/inactive-foreground-color "#34495e")
 '(speedbar-supported-extension-expressions
   (quote
    (".wy" ".by" ".[ch]\\(\\+\\+\\|pp\\|c\\|h\\|xx\\)?" ".tex\\(i\\(nfo\\)?\\)?" ".el" ".emacs" ".l" ".lsp" ".p" ".java" ".f\\(90\\|77\\|or\\)?" ".ada" ".p[lm]" ".tcl" ".m" ".scm" ".pm" ".py" ".g" ".s?html" ".ma?k" "[Mm]akefile\\(\\.in\\)?" ".feature" "Rakefile" ".rb" ".yml")))
 '(tabbar-background-color "#353535")
 '(term-buffer-maximum-size 0)
 '(weechat-color-list
   (unspecified "#242728" "#424748" "#F70057" "#ff0066" "#86C30D" "#63de5d" "#BEB244" "#E6DB74" "#40CAE4" "#06d8ff" "#FF61FF" "#ff8eff" "#00b2ac" "#53f2dc" "#f8fbfc" "#ffffff"))
 '(xterm-color-names
   ["#414E63" "#CC71D1" "#88D6CB" "#C79474" "#76A2D1" "#4A4B6B" "#96A9D6" "#8E95A3"])
 '(xterm-color-names-bright
   ["#555B77" "#E074DB" "#8BE8D8" "#B2DEC1" "#75B5EB" "#9198EB" "#C3C3E8" "#838791"]))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-punctuation ((t (:inherit diff-changed :foreground "plum1"))) t)
 '(linum-highlight-face ((t (:foreground "gray100"))))
 '(markdown-code-face ((t (:inherit fixed-pitch))))
 '(org-block ((t (:foreground "wheat3"))))
 '(woman-bold ((t (:inherit bold :foreground "dodger blue"))))
 '(woman-italic ((t (:foreground "gold2")))))

;; don't disable narrow-to-region
(put 'narrow-to-region 'disabled nil)
