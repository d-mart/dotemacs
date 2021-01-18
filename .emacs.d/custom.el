;; customization stuff made by emacs's customization UI

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(Linum-format "%7i ")
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   ["#FAFAFA" "#FF1744" "#66BB6A" "#F57F17" "#42A5F5" "#7E57C2" "#0097A7" "#546E7A"])
 '(ansi-term-color-vector
   [unspecified "#FFFFFF" "#d15120" "#5f9411" "#d2ad00" "#6b82a7" "#a66bab" "#6b82a7" "#505050"] t)
 '(beacon-color "#ec4780")
 '(clojure-indent-style 'always-indent)
 '(company-quickhelp-color-background "#4F4F4F")
 '(company-quickhelp-color-foreground "#DCDCCC")
 '(compilation-message-face 'default)
 '(custom-enabled-themes '(darkokai))
 '(custom-safe-themes
   '("f2927d7d87e8207fa9a0a003c0f222d45c948845de162c885bf6ad2a255babfd" "c3e6b52caa77cb09c049d3c973798bc64b5c43cc437d449eacf35b3e776bf85c" "830c887bd2cefd77326ddf24389f3806c2a561a550e309691933f772f1bc5825" "7922b14d8971cce37ddb5e487dbc18da5444c47f766178e5a4e72f90437c0711" "716f0a8a9370912d9e6659948c2cb139c164b57ef5fda0f337f0f77d47fe9073" "d6603a129c32b716b3d3541fc0b6bfe83d0e07f1954ee64517aa62c9405a3441" "ae88c445c558b7632fc2d72b7d4b8dfb9427ac06aa82faab8d760fff8b8f243c" "928ed6d4997ec3cdce10b65c59d0f966a61792a69b84c47155cb5578ce2972be" "08a27c4cde8fcbb2869d71fdc9fa47ab7e4d31c27d40d59bf05729c4640ce834" "aaa4c36ce00e572784d424554dcc9641c82d1155370770e231e10c649b59a074" "6c3b5f4391572c4176908bb30eddc1718344b8eaff50e162e36f271f6de015ca" "2cdc13ef8c76a22daa0f46370011f54e79bae00d5736340a5ddfe656a767fddf" "2f1518e906a8b60fac943d02ad415f1d8b3933a5a7f75e307e6e9a26ef5bf570" "bf387180109d222aee6bb089db48ed38403a1e330c9ec69fe1f52460a8936b66" "6b80b5b0762a814c62ce858e9d72745a05dd5fc66f821a1c5023b4f2a76bc910" "8d7684de9abb5a770fbfd72a14506d6b4add9a7d30942c6285f020d41d76e0fa" "0ac7d13bc30eac2f92bbc3008294dafb5ba5167f2bf25c0a013f29f62763b996" "9549755e996a2398585714b0af745d2be5387ecf7ec299ff355ec6bef495be88" "3c2f28c6ba2ad7373ea4c43f28fcf2eed14818ec9f0659b1c97d4e89c99e091e" "5b809c3eae60da2af8a8cfba4e9e04b4d608cb49584cb5998f6e4a1c87c057c4" "d74c5485d42ca4b7f3092e50db687600d0e16006d8fa335c69cf4f379dbd0eee" "7b3d184d2955990e4df1162aeff6bfb4e1c3e822368f0359e15e2974235d9fa8" "71e5acf6053215f553036482f3340a5445aee364fb2e292c70d9175fb0cc8af7" "e6ff132edb1bfa0645e2ba032c44ce94a3bd3c15e3929cdf6c049802cf059a2a" "37144b437478e4c235824f0e94afa740ee2c7d16952e69ac3c5ed4352209eefb" "79278310dd6cacf2d2f491063c4ab8b129fee2a498e4c25912ddaa6c3c5b621e" "711efe8b1233f2cf52f338fd7f15ce11c836d0b6240a18fffffc2cbd5bfe61b0" "5d09b4ad5649fea40249dd937eaaa8f8a229db1cec9a1a0ef0de3ccf63523014" "dde8c620311ea241c0b490af8e6f570fdd3b941d7bc209e55cd87884eb733b0e" "be9645aaa8c11f76a10bcf36aaf83f54f4587ced1b9b679b55639c87404e2499" "f3ab34b145c3b2a0f3a570ddff8fabb92dafc7679ac19444c31058ac305275e1" "76bfa9318742342233d8b0b42e824130b3a50dcc732866ff8e47366aed69de11" "0cd00c17f9c1f408343ac77237efca1e4e335b84406e05221126a6ee7da28971" "816bacf37139d6204b761fea0d25f7f2f43b94affa14aa4598bce46157c160c2" "c9339f02e534c814a5ceca3c95541bde47ba55877e53601c5f64ffd9dcdbc4f7" "f3455b91943e9664af7998cc2c458cfc17e674b6443891f519266e5b3c51799d" "a2cde79e4cc8dc9a03e7d9a42fabf8928720d420034b66aecc5b665bbf05d4e9" "c7f10959cb1bc7a36ee355c765a1768d48929ec55dde137da51077ac7f899521" "a7051d761a713aaf5b893c90eaba27463c791cd75d7257d3a8e66b0c8c346e77" "5772b2e07cef4a2a558b803c403caa983ee9b77c8ab35d414d826e09e80df8c8" "e3c87e869f94af65d358aa279945a3daf46f8185f1a5756ca1c90759024593dd" "a2ec1b9fb1001e0ff20cf4d8081d274e9e4ea5d54b41111bc018aab481868fd5" "37ba833442e0c5155a46df21446cadbe623440ccb6bbd61382eb869a2b9e9bf9" "4d7ff351a2cde3a959d4a47fc98b1735ad5884120ea17d91bfcdf66dc23b1010" "ab564a7ce7f2b2ad9e2cfe9fe1019b5481809dd7a0e36240c9139e230cc2bc32" "dd43ce1171324a8e47f9e4ca9f49773c4b4960706171ab951130c668adc59f53" "3a3de615f80a0e8706208f0a71bbcc7cc3816988f971b6d237223b6731f91605" "5d3e0746023fc5e246eb3e0e48c1ccb5ce0387fc4273896c6cf02ee349c2eba8" "748d0e2ffdaf95015a539dcc95ab888283284ad7b076963760422cbe5e21903a" "d61fc0e6409f0c2a22e97162d7d151dee9e192a90fa623f8d6a071dbf49229c6" "8891c81848a6cf203c7ac816436ea1a859c34038c39e3cf9f48292d8b1c86528" "e11569fd7e31321a33358ee4b232c2d3cf05caccd90f896e1df6cab228191109" "a3fa4abaf08cc169b61dea8f6df1bbe4123ec1d2afeb01c17e11fdc31fc66379" "ecba61c2239fbef776a72b65295b88e5534e458dfe3e6d7d9f9cb353448a569e" "6350f0cf3091e574a5de01d7309c0b456d814756a79867eac02c11b262d04a2e" "aae95fc700f9f7ff70efbc294fc7367376aa9456356ae36ec234751040ed9168" "0e33022384e4db1374827f51e3d9e9a2d56282c2e3568c22f1c12ad80e20cf0c" "4697a2d4afca3f5ed4fdf5f715e36a6cac5c6154e105f3596b44a4874ae52c45" "5f4e4c9f5de8156f964fdf8a1b8f8f659efbfeff88b38f49ce13953a84272b77" "2941526f0165b681482a7bfe61b071db10c6df090d04a530c593254ea6412054" "3b0a350918ee819dca209cec62d867678d7dac74f6195f5e3799aa206358a983" "d600c677f1777c1e4bfb066529b5b73c0179d0499dd4ffa3f599a0fb0cfbd501" "408e753da5ce585ad73a0388b50749ef4dcf2b047583fb1378516576e40fa71b" "82b67c7e21c3b12be7b569af7c84ec0fb2d62105629a173e2479e1053cff94bd" "a24c5b3c12d147da6cef80938dca1223b7c7f70f2f382b26308eba014dc4833a" "15348febfa2266c4def59a08ef2846f6032c0797f001d7b9148f30ace0d08bcf" "5a0eee1070a4fc64268f008a4c7abfda32d912118e080e18c3c865ef864d1bea" "365d9553de0e0d658af60cff7b8f891ca185a2d7ba3fc6d29aadba69f5194c7f" "6ee6f99dc6219b65f67e04149c79ea316ca4bcd769a9e904030d38908fd7ccf9" default))
 '(debug-on-error nil)
 '(diary-entry-marker 'font-lock-variable-name-face)
 '(ediff-diff-options "-w" t)
 '(evil-emacs-state-cursor '("#D50000" hbar))
 '(evil-insert-state-cursor '("#D50000" bar))
 '(evil-normal-state-cursor '("#F57F17" box))
 '(evil-visual-state-cursor '("#66BB6A" box))
 '(fci-rule-character-color "#d9d9d9")
 '(fci-rule-color "#323342")
 '(frame-brackground-mode 'dark)
 '(fringe-mode '(0) nil (fringe))
 '(global-git-commit-mode t)
 '(highlight-changes-colors '("#ff8eff" "#ab7eff"))
 '(highlight-indent-guides-auto-enabled nil)
 '(highlight-symbol-colors
   '("#FFEE58" "#C5E1A5" "#80DEEA" "#64B5F6" "#E1BEE7" "#FFCC80"))
 '(highlight-symbol-foreground-color "#E0E0E0")
 '(highlight-tail-colors '(("#F8BBD0" . 0) ("#FAFAFA" . 100)))
 '(hl-paren-background-colors '("#2492db" "#95a5a6" nil))
 '(hl-paren-colors
   '("firebrick1" "DarkOrange2" "yellow3" "green2" "blue1" "DarkOrchid3"))
 '(hl-sexp-background-color "#1c1f26")
 '(indicate-buffer-boundaries 'right)
 '(indicate-empty-lines t)
 '(jdee-db-active-breakpoint-face-colors (cons "#191C25" "#80A0C2"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#191C25" "#A2BF8A"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#191C25" "#434C5E"))
 '(js-indent-level 2)
 '(js2-basic-offset 2)
 '(js2-bounce-indent-p nil)
 '(js2-highlight-level 3)
 '(js2-missing-semi-one-line-override nil)
 '(js2-mode-indent-ignore-first-tab t)
 '(js2-strict-missing-semi-warning nil)
 '(linum-format " %5i ")
 '(magit-diff-use-overlays nil)
 '(magit-log-arguments '("--color" "--decorate" "-n256"))
 '(magit-use-overlays nil)
 '(main-line-color1 "#1E1E1E")
 '(main-line-color2 "#111111")
 '(main-line-separator-style 'chamfer)
 '(nrepl-message-colors
   '("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3"))
 '(objed-cursor-color "#C16069")
 '(package-selected-packages
   '(circleci-api symbol-navigation-hydra undersea-theme typescript-mode org-jira ox-jira zenburn-theme vs-dark-theme smartparens rspec-mode rg plantuml-mode phi-search-mc phi-search-dired phi-grep org-fragtog nov nimbus-theme mlso-theme major-mode-hydra js2-mode ivy-hydra ivy-explorer go-mode ewal-doom-themes dired-sidebar dired-git bufler all-the-icons-ivy-rich all-the-icons-ibuffer horizon-theme clojure-mode counsel-jq cider git-walktree org-bullets all-the-icons-ivy treemacs ob-sql-mode sqlup-mode grip-mode hercules 0x0 dart-server highlight-thing frog-jump-buffer naysayer-theme wgrep-ag web-mode web-mode-edit-element web-narrow-mode ob-dart flutter font-lock-studio goto-line-preview terminal-toggle emmet-mode forge ivy-pages ns-auto-titlebar isolate fd-dired ess deadgrep all-the-icons-dired "amx" shut-up epl git commander f dash s ivy-yasnippet load-env-vars nova-theme ob-elixir ob-restclient graphviz-dot-mode dired-filter dired-narrow dired-subtree swoop elcontext panda-theme sequential-command smart-jump projectile-rails counsel-projectile dotenv-mode scp docker docker-compose-mode docker-tramp chronos dumb-diff pocket-reader buffer-watcher org-web-tools winnow x509-mode bind-chord ido-completing-read+ amx org2web vc-msg crux isend-mode gist face-explorer find-file-in-project fzf org-sticky-header groovy-mode navi-mode viewer vmd-mode async-await fuff madhat2r-theme markdown-edit-indirect markdown-preview-eww markdown-preview-mode zweilight-theme distinguished-theme gratuitous-dark-theme gruber-darker-theme kooten-theme rust-playground winum apib-mode elmacro darkane-theme erlang emacs-profiles webpaste 0xc direnv dkl ripgrep counsel-dash doom-themes monitor cmake-mode better-shell pcap-mode transfer-sh eshell-autojump which-key f3 forest-blue-theme gotham-theme darkokai-theme moonscript redtick helm-c-moccur moccur-edit counsel ace-mc dark-mint-theme try buffer-move ggtags helm-gtags dumb-jump omtose-phellack-theme fireplace firestarter flycheck-clangcheck comment-dwim-2 zzz-to-char zone-rainbow elixir-yasnippets sublime-themes sift highlight-indent-guides code-library darcula-theme dark-krystal-theme darkburn-theme slim-mode termbright-theme pastelmac-theme helm-grepint helm-fuzzier bpr jenkins beacon abyss-theme emacsql-mysql scratches tab-jump-out use-package-chords subemacs smart-region w3m atom-one-dark-theme atom-dark-theme skewer-mode async ahungry-theme org-wunderlist org-sync aurora-theme color-moccur emacsql turnip emamux zerodark-theme kaesar-mode kaesar-file kaesar dart-mode rainbow-mode alchemist alect-themes ample-theme ample-zen-theme eshell-prompt-extras eshell-z fasd eno auto-complete peek-mode ace-window pomodoro protobuf-mode recompile-on-save help-mode+ help-fns+ redis package-safe-delete corral elixir-mode planet-theme zonokai-theme avy multi-term marcopolo kerl rpn-calc highlight-indentation apropospriate-theme mellow-theme moe-theme darktooth-theme material-theme ztree zen-and-art-theme yari wgrep warm-night-theme visual-regexp-steroids vagrant twilight-theme twilight-bright-theme twilight-anti-bright-theme toxi-theme subatomic256-theme string-utils spacegray-theme soothe-theme sml-modeline seti-theme scss-mode rvm ruby-tools ruby-interpolation ruby-block roguel-ike reverse-theme rainbow-delimiters railscasts-theme phoenix-dark-pink-theme peep-dired pallet noccur neotree naquadah-theme move-line molokai-theme mode-line-debug mc-extras math-at-point markdown-mode+ mark-multiple mark-more-like-this magit-push-remote lush-theme lua-mode lfe-mode key-chord jg-quicknav jabber ir-black-theme impatient-mode iflipb iedit ibuffer-vc ibuffer-tramp ibuffer-git hlinum highlight-parentheses highlight-numbers hide-lines heroku-theme helm-projectile-all haste haml-mode hackernews guru-mode grandshell-theme gitignore-mode gitconfig-mode git-timemachine git-messenger free-keys flx-ido flatui-theme firebelly-theme fiplr feature-mode expand-region etags-select es-lib elisp-slime-nav edts easy-kill dockerfile-mode dired+ darkmine-theme dark-souls cycle-resize cyberpunk-theme coffee-mode browse-kill-ring bm awk-it auto-yasnippet auto-indent-mode auto-complete-etags anti-zenburn-theme android-mode ag afternoon-theme ace-jump-buffer ace-isearch use-package undo-tree ruby-electric restclient rake powerline pivotal-tracker monokai-theme magit-popup log4e json-snatcher json-reformat json-mode inflections inf-ruby gntp git-commit emojify diminish circe alert))
 '(pdf-view-midnight-colors (cons "#f7f1ff" "#222222"))
 '(pos-tip-background-color "#E6DB74")
 '(pos-tip-foreground-color "#242728")
 '(powerline-color1 "#1E1E1E")
 '(powerline-color2 "#111111")
 '(remote-shell-program "ssh")
 '(rustic-ansi-faces
   ["#222222" "#fc618d" "#7bd88f" "#fce566" "#5ad4e6" "#5ad4e6" "#5ad4e6" "#f7f1ff"])
 '(safe-local-variable-values
   '((ffip-project-root . "/Users/dmartinez/proj/intelliconnect/")
     (ffip-find-options . "-not -regex '.*beam'")))
 '(sml-modeline-mode t)
 '(sml/active-background-color "#34495e")
 '(sml/active-foreground-color "#ecf0f1")
 '(sml/inactive-background-color "#dfe4ea")
 '(sml/inactive-foreground-color "#34495e")
 '(speedbar-supported-extension-expressions
   '(".wy" ".by" ".[ch]\\(\\+\\+\\|pp\\|c\\|h\\|xx\\)?" ".tex\\(i\\(nfo\\)?\\)?" ".el" ".emacs" ".l" ".lsp" ".p" ".java" ".f\\(90\\|77\\|or\\)?" ".ada" ".p[lm]" ".tcl" ".m" ".scm" ".pm" ".py" ".g" ".s?html" ".ma?k" "[Mm]akefile\\(\\.in\\)?" ".feature" "Rakefile" ".rb" ".yml"))
 '(tabbar-background-color "#353535")
 '(term-buffer-maximum-size 0)
 '(vc-annotate-background "#222222")
 '(vc-annotate-color-map
   (list
    (cons 20 "#7bd88f")
    (cons 40 "#a6dc81")
    (cons 60 "#d1e073")
    (cons 80 "#fce566")
    (cons 100 "#fcc95f")
    (cons 120 "#fcae59")
    (cons 140 "#fd9353")
    (cons 160 "#c6a884")
    (cons 180 "#90beb5")
    (cons 200 "#5ad4e6")
    (cons 220 "#90adc8")
    (cons 240 "#c687aa")
    (cons 260 "#fc618d")
    (cons 280 "#d15c7e")
    (cons 300 "#a75870")
    (cons 320 "#7c5461")
    (cons 340 "#585858")
    (cons 360 "#585858")))
 '(vc-annotate-very-old-color nil)
 '(web-mode-code-indent-offset 2 nil nil "2 spaces")
 '(web-mode-css-indent-offset 2 nil nil "2 spaces")
 '(web-mode-enable-current-column-highlight t nil nil "Customized with use-package web-mode")
 '(web-mode-enable-current-element-highlight t nil nil "Customized with use-package web-mode")
 '(web-mode-extra-auto-pairs '(("erb" ("beg" "end"))) nil nil "Customized with use-package web-mode")
 '(web-mode-markup-indent-offset 2 nil nil "4 spaces good, 2 spaces better")
 '(weechat-color-list
   (unspecified "#242728" "#323342" "#F70057" "#ff0066" "#86C30D" "#63de5d" "#BEB244" "#E6DB74" "#40CAE4" "#06d8ff" "#FF61FF" "#ff8eff" "#00b2ac" "#53f2dc" "#f8fbfc" "#ffffff"))
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
 '(org-level-4 ((t (:inherit org-level-3 :foreground "orchid3"))))
 '(org-level-5 ((t (:inherit org-level-3 :foreground "SkyBlue2"))))
 '(org-level-6 ((t (:inherit org-level-3 :foreground "goldenrod2"))))
 '(org-level-8 ((t (:foreground "NavajoWhite3" :weight semi-bold))))
 '(outline-3 ((t (:extend t :foreground "medium sea green" :weight bold))))
 '(woman-bold ((t (:inherit bold :foreground "dodger blue"))))
 '(woman-italic ((t (:foreground "gold2")))))

;; don't disable narrow-to-region
(put 'narrow-to-region 'disabled nil)
