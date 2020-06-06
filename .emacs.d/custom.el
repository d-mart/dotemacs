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
 '(clojure-indent-style (quote always-indent))
 '(company-quickhelp-color-background "#4F4F4F")
 '(company-quickhelp-color-foreground "#DCDCCC")
 '(custom-enabled-themes (quote (darkokai)))
 '(custom-safe-themes
   (quote
    ("e1ef2d5b8091f4953fe17b4ca3dd143d476c106e221d92ded38614266cea3c8b" "2cdc13ef8c76a22daa0f46370011f54e79bae00d5736340a5ddfe656a767fddf" "8a379e7ac3a57e64de672dd744d4730b3bdb88ae328e8106f95cd81cbd44e0b6" "51956e440cec75ba7e4cff6c79f4f8c884a50b220e78e5e05145386f5b381f7b" "229c5cf9c9bd4012be621d271320036c69a14758f70e60385e87880b46d60780" "774aa2e67af37a26625f8b8c86f4557edb0bac5426ae061991a7a1a4b1c7e375" "a339f231e63aab2a17740e5b3965469e8c0b85eccdfb1f9dbd58a30bdad8562b" "be9645aaa8c11f76a10bcf36aaf83f54f4587ced1b9b679b55639c87404e2499" "9743d1941d0559264aa21a542e55043c032d779024cd70468d1123c320699fd1" "559b28ae6deb74713fee9064e7ece54cb71ba645f44acbf81ad7916a4f947815" "6de37d6d573e18138aa948683c8ff0e72b89e90d1cdbf683787ea72f8e6295ab" "f3455b91943e9664af7998cc2c458cfc17e674b6443891f519266e5b3c51799d" "a2cde79e4cc8dc9a03e7d9a42fabf8928720d420034b66aecc5b665bbf05d4e9" "c7f10959cb1bc7a36ee355c765a1768d48929ec55dde137da51077ac7f899521" "a7051d761a713aaf5b893c90eaba27463c791cd75d7257d3a8e66b0c8c346e77" "5772b2e07cef4a2a558b803c403caa983ee9b77c8ab35d414d826e09e80df8c8" "e3c87e869f94af65d358aa279945a3daf46f8185f1a5756ca1c90759024593dd" "a2ec1b9fb1001e0ff20cf4d8081d274e9e4ea5d54b41111bc018aab481868fd5" "37ba833442e0c5155a46df21446cadbe623440ccb6bbd61382eb869a2b9e9bf9" "4d7ff351a2cde3a959d4a47fc98b1735ad5884120ea17d91bfcdf66dc23b1010" "ab564a7ce7f2b2ad9e2cfe9fe1019b5481809dd7a0e36240c9139e230cc2bc32" "dd43ce1171324a8e47f9e4ca9f49773c4b4960706171ab951130c668adc59f53" "3a3de615f80a0e8706208f0a71bbcc7cc3816988f971b6d237223b6731f91605" "5d3e0746023fc5e246eb3e0e48c1ccb5ce0387fc4273896c6cf02ee349c2eba8" "748d0e2ffdaf95015a539dcc95ab888283284ad7b076963760422cbe5e21903a" "d61fc0e6409f0c2a22e97162d7d151dee9e192a90fa623f8d6a071dbf49229c6" "8891c81848a6cf203c7ac816436ea1a859c34038c39e3cf9f48292d8b1c86528" "e11569fd7e31321a33358ee4b232c2d3cf05caccd90f896e1df6cab228191109" "a3fa4abaf08cc169b61dea8f6df1bbe4123ec1d2afeb01c17e11fdc31fc66379" "ecba61c2239fbef776a72b65295b88e5534e458dfe3e6d7d9f9cb353448a569e" "6350f0cf3091e574a5de01d7309c0b456d814756a79867eac02c11b262d04a2e" "aae95fc700f9f7ff70efbc294fc7367376aa9456356ae36ec234751040ed9168" "0e33022384e4db1374827f51e3d9e9a2d56282c2e3568c22f1c12ad80e20cf0c" "4697a2d4afca3f5ed4fdf5f715e36a6cac5c6154e105f3596b44a4874ae52c45" "5f4e4c9f5de8156f964fdf8a1b8f8f659efbfeff88b38f49ce13953a84272b77" "2941526f0165b681482a7bfe61b071db10c6df090d04a530c593254ea6412054" "3b0a350918ee819dca209cec62d867678d7dac74f6195f5e3799aa206358a983" "d600c677f1777c1e4bfb066529b5b73c0179d0499dd4ffa3f599a0fb0cfbd501" "408e753da5ce585ad73a0388b50749ef4dcf2b047583fb1378516576e40fa71b" "82b67c7e21c3b12be7b569af7c84ec0fb2d62105629a173e2479e1053cff94bd" "a24c5b3c12d147da6cef80938dca1223b7c7f70f2f382b26308eba014dc4833a" "15348febfa2266c4def59a08ef2846f6032c0797f001d7b9148f30ace0d08bcf" "5a0eee1070a4fc64268f008a4c7abfda32d912118e080e18c3c865ef864d1bea" "365d9553de0e0d658af60cff7b8f891ca185a2d7ba3fc6d29aadba69f5194c7f" "6ee6f99dc6219b65f67e04149c79ea316ca4bcd769a9e904030d38908fd7ccf9" default)))
 '(debug-on-error nil)
 '(diary-entry-marker (quote font-lock-variable-name-face))
 '(ediff-diff-options "-w" t)
 '(evil-emacs-state-cursor (quote ("#E57373" hbar)))
 '(evil-insert-state-cursor (quote ("#E57373" bar)))
 '(evil-normal-state-cursor (quote ("#FFEE58" box)))
 '(evil-visual-state-cursor (quote ("#C5E1A5" box)))
 '(fci-rule-character-color "#d9d9d9")
 '(frame-brackground-mode (quote dark))
 '(fringe-mode (quote (0)) nil (fringe))
 '(global-git-commit-mode t)
 '(highlight-indent-guides-auto-enabled nil)
 '(highlight-symbol-colors
   (quote
    ("#FFEE58" "#C5E1A5" "#80DEEA" "#64B5F6" "#E1BEE7" "#FFCC80")))
 '(highlight-symbol-foreground-color "#E0E0E0")
 '(hl-paren-background-colors (quote ("#2492db" "#95a5a6" nil)))
 '(hl-paren-colors
   (quote
    ("firebrick1" "DarkOrange2" "yellow3" "green2" "blue1" "DarkOrchid3")))
 '(hl-sexp-background-color "#1c1f26")
 '(indicate-buffer-boundaries (quote right))
 '(indicate-empty-lines t)
 '(js-indent-level 2)
 '(js2-basic-offset 2)
 '(js2-bounce-indent-p nil)
 '(js2-highlight-level 3)
 '(js2-missing-semi-one-line-override nil)
 '(js2-mode-indent-ignore-first-tab t)
 '(js2-strict-missing-semi-warning nil)
 '(linum-format " %5i ")
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
    (org-jira ox-jira zzz-to-char zweilight-theme ztree zenburn-theme yari x509-mode winum winnow wgrep-ag webpaste web-narrow-mode web-mode-edit-element vs-dark-theme vmd-mode visual-regexp-steroids viewer vc-msg vagrant undo-tree transfer-sh swoop string-utils sqlup-mode soothe-theme sml-modeline smartparens smart-jump sequential-command scss-mode scp rvm rust-playground ruby-tools ruby-interpolation ruby-electric ruby-block rspec-mode rpn-calc roguel-ike ripgrep rg redis recompile-on-save rainbow-delimiters railscasts-theme protobuf-mode projectile-rails powerline pomodoro pocket-reader plantuml-mode pivotal-tracker phoenix-dark-pink-theme phi-search-mc phi-search-dired phi-grep peep-dired peek-mode pcap-mode panda-theme pallet package-safe-delete org2web org-sticky-header org-fragtog org-bullets omtose-phellack-theme ob-sql-mode ob-restclient ob-elixir ob-dart ns-auto-titlebar nova-theme nov noccur nimbus-theme neotree naysayer-theme navi-mode multi-term move-line monitor molokai-theme mode-line-debug mlso-theme melancholy-theme mc-extras math-at-point material-theme markdown-preview-mode markdown-preview-eww markdown-mode+ mark-multiple mark-more-like-this marcopolo major-mode-hydra magit-popup madhat2r-theme lua-mode load-env-vars lfe-mode kooten-theme kerl js2-mode jg-quicknav ivy-yasnippet ivy-pages ivy-hydra ivy-explorer isolate isend-mode impatient-mode iflipb iedit ido-completing-read+ ibuffer-vc ibuffer-tramp ibuffer-git hlinum highlight-thing highlight-parentheses highlight-numbers highlight-indentation hide-lines heroku-theme hercules haste haml-mode hackernews guru-mode gruber-darker-theme groovy-mode grip-mode gratuitous-dark-theme graphviz-dot-mode go-mode gitignore-mode gitconfig-mode git-walktree git-timemachine git-messenger gist fzf fuff frog-jump-buffer free-keys forge font-lock-studio flx-ido flutter flatui-theme fireplace fiplr find-file-in-project feature-mode fd-dired face-explorer expand-region ewal-doom-themes etags-select ess eshell-z eshell-prompt-extras eshell-autojump es-lib erlang emojify emmet-mode elmacro elixir-yasnippets elisp-slime-nav elcontext easy-kill dumb-diff dotenv-mode dockerfile-mode docker-compose-mode docker dkl distinguished-theme direnv dired-sidebar dired-narrow dired-git dired-filter diminish deadgrep dart-server dart-mode darkokai-theme darkburn-theme dark-krystal-theme cycle-resize cyberpunk-theme crux counsel-projectile counsel-jq counsel-dash corral coffee-mode cmake-mode clojure-mode circe chronos bufler buffer-watcher buffer-move browse-kill-ring bm bind-chord better-shell beacon auto-yasnippet auto-indent-mode auto-complete-etags apropospriate-theme apib-mode android-mode amx all-the-icons-ivy-rich all-the-icons-ibuffer all-the-icons-dired alert alchemist ag ace-jump-buffer ace-isearch 0xc 0x0)))
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
 '(web-mode-code-indent-offset 2)
 '(web-mode-css-indent-offset 2)
 '(web-mode-enable-current-column-highlight t)
 '(web-mode-enable-current-element-highlight t)
 '(web-mode-extra-auto-pairs (quote (("erb" ("beg" "end")))))
 '(web-mode-markup-indent-offset 2)
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
 '(org-block ((t (:foreground "wheat3"))))
 '(org-level-4 ((t (:inherit org-level-3 :foreground "orchid3"))))
 '(org-level-5 ((t (:inherit org-level-3 :foreground "SkyBlue2"))))
 '(org-level-6 ((t (:inherit org-level-3 :foreground "goldenrod2"))))
 '(org-level-8 ((t (:foreground "NavajoWhite3" :weight semi-bold)))))

;; don't disable narrow-to-region
(put 'narrow-to-region 'disabled nil)
