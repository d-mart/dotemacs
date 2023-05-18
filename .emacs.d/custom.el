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
 '(clojure-indent-style 'always-indent)
 '(company-quickhelp-color-background "#4F4F4F")
 '(company-quickhelp-color-foreground "#DCDCCC")
 '(compilation-message-face 'default)
 '(custom-enabled-themes '(monokai))
 '(custom-safe-themes
   '("be84a2e5c70f991051d4aaf0f049fa11c172e5d784727e0b525565bb1533ec78" "0466adb5554ea3055d0353d363832446cd8be7b799c39839f387abb631ea0995" "d9646b131c4aa37f01f909fbdd5a9099389518eb68f25277ed19ba99adeb7279" default))
 '(diary-entry-marker 'font-lock-variable-name-face)
 '(diff-hl-show-hunk-posframe-internal-border-color "#ffffffffffff")
 '(ediff-diff-options "-w")
 '(evil-emacs-state-cursor '("#D50000" hbar))
 '(evil-insert-state-cursor '("#D50000" bar))
 '(evil-normal-state-cursor '("#F57F17" box))
 '(evil-visual-state-cursor '("#66BB6A" box))
 '(fci-rule-character-color "#d9d9d9")
 '(frame-brackground-mode 'dark)
 '(fringe-mode '(0) nil (fringe))
 '(global-git-commit-mode t)
 '(gnutls-algorithm-priority "normal:-vers-tls1.3")
 '(highlight-changes-colors '("#ff8eff" "#ab7eff"))
 '(highlight-indent-guides-auto-enabled nil)
 '(highlight-symbol-colors
   '("#FFEE58" "#C5E1A5" "#80DEEA" "#64B5F6" "#E1BEE7" "#FFCC80"))
 '(highlight-symbol-foreground-color "#E0E0E0")
 '(hl-paren-background-colors '("#2492db" "#95a5a6" nil))
 '(hl-paren-colors
   '("firebrick1" "DarkOrange2" "yellow3" "green2" "blue1" "DarkOrchid3"))
 '(hl-sexp-background-color "#1c1f26")
 '(indicate-buffer-boundaries 'right)
 '(indicate-empty-lines t)
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
 '(mlscroll-in-color "#e67fe67fe67f")
 '(mlscroll-out-color "#FAFAFA")
 '(nrepl-message-colors
   '("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3"))
 '(package-selected-packages
   '(urgrep yasnippet magit highlight-numbers-mode rainbow-delimeters org ob-go org-mode swiper multiple-cursors auto-indent visual-regexp key-chord zzz-to-char exec-path-from-shell ace-jump-mode tangonov-theme blamer ruled-switch-buffer code-review dirvish github-dark-vscode-theme impostman json-par pr-review shelldon nano-modeline nano-theme snow consult-dir crdt puni jq-mode affe devdocs-browser timu-spacegrey-theme eshell-autojump eshell-prompt-extras smartparens dream-theme frecentf doom-modeline multi-vterm circleci-api typescript-mode diredc embark marginalia xmind-org eshell-syntax-highlighting symbol-navigation-hydra undersea-theme org-jira rspec-mode plantuml-mode phi-search-mc phi-search-dired phi-grep org-fragtog nov nimbus-theme mlso-theme major-mode-hydra js2-mode ivy-hydra ivy-explorer go-mode ewal-doom-themes dired-sidebar dired-git bufler all-the-icons-ivy-rich all-the-icons-ibuffer horizon-theme clojure-mode counsel-jq cider git-walktree org-bullets all-the-icons-ivy ob-sql-mode sqlup-mode grip-mode hercules dart-server highlight-thing frog-jump-buffer naysayer-theme wgrep-ag web-mode web-mode-edit-element web-narrow-mode ob-dart flutter font-lock-studio goto-line-preview terminal-toggle forge ivy-pages ns-auto-titlebar isolate fd-dired ess deadgrep all-the-icons-dired amx epl git commander f dash s ivy-yasnippet load-env-vars nova-theme ob-restclient graphviz-dot-mode dired-filter dired-narrow dired-subtree swoop elcontext panda-theme sequential-command counsel-projectile dotenv-mode scp docker docker-compose-mode docker-tramp chronos dumb-diff pocket-reader buffer-watcher winnow bind-chord ido-completing-read+ amx org2web crux isend-mode gist face-explorer find-file-in-project fzf groovy-mode viewer vmd-mode async-await fuff madhat2r-theme markdown-edit-indirect markdown-preview-eww markdown-preview-mode zweilight-theme distinguished-theme gratuitous-dark-theme gruber-darker-theme kooten-theme rust-playground winum elmacro darkane-theme erlang emacs-profiles 0xc direnv dkl ripgrep counsel-dash doom-themes monitor cmake-mode better-shell pcap-mode transfer-sh f3 forest-blue-theme gotham-theme darkokai-theme moonscript redtick helm-c-moccur moccur-edit counsel ace-mc dark-mint-theme try buffer-move ggtags helm-gtags dumb-jump omtose-phellack-theme fireplace firestarter flycheck-clangcheck comment-dwim-2 zone-rainbow elixir-yasnippets sublime-themes sift highlight-indent-guides code-library darcula-theme dark-krystal-theme darkburn-theme slim-mode termbright-theme pastelmac-theme helm-grepint helm-fuzzier bpr jenkins beacon abyss-theme emacsql-mysql scratches tab-jump-out use-package-chords subemacs smart-region w3m atom-one-dark-theme atom-dark-theme skewer-mode async ahungry-theme org-wunderlist org-sync aurora-theme color-moccur emacsql turnip emamux zerodark-theme kaesar-mode kaesar-file kaesar dart-mode rainbow-mode alchemist alect-themes ample-theme ample-zen-theme eshell-z fasd eno peek-mode ace-window pomodoro protobuf-mode recompile-on-save help-mode+ help-fns+ redis package-safe-delete corral elixir-mode planet-theme zonokai-theme avy multi-term marcopolo highlight-indentation mellow-theme moe-theme darktooth-theme material-theme zen-and-art-theme yari warm-night-theme visual-regexp-steroids vagrant twilight-theme twilight-bright-theme twilight-anti-bright-theme toxi-theme subatomic256-theme string-utils spacegray-theme soothe-theme sml-modeline seti-theme scss-mode ruby-tools ruby-interpolation ruby-block roguel-ike reverse-theme rainbow-delimiters railscasts-theme phoenix-dark-pink-theme peep-dired pallet noccur neotree naquadah-theme move-line molokai-theme mc-extras math-at-point markdown-mode+ mark-multiple mark-more-like-this magit-push-remote lush-theme lua-mode lfe-mode jg-quicknav jabber ir-black-theme impatient-mode iedit ibuffer-vc ibuffer-tramp ibuffer-git hlinum highlight-parentheses highlight-numbers hide-lines heroku-theme helm-projectile-all haste haml-mode hackernews grandshell-theme gitignore-mode gitconfig-mode git-timemachine free-keys flx-ido flatui-theme firebelly-theme fiplr feature-mode expand-region etags-select es-lib elisp-slime-nav edts easy-kill dockerfile-mode dired+ darkmine-theme dark-souls cycle-resize cyberpunk-theme browse-kill-ring bm awk-it auto-yasnippet auto-indent-mode auto-complete-etags anti-zenburn-theme android-mode afternoon-theme ace-jump-buffer ace-isearch use-package undo-tree ruby-electric restclient rake pivotal-tracker monokai-theme magit-popup log4e json-snatcher json-reformat json-mode inflections inf-ruby gntp git-commit emojify diminish circe))
 '(pdf-view-midnight-colors (cons "#f7f1ff" "#222222"))
 '(pos-tip-background-color "#E6DB74")
 '(pos-tip-foreground-color "#242728")
 '(powerline-color1 "#1E1E1E")
 '(powerline-color2 "#111111")
 '(remote-shell-program "ssh")
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
 '(vc-annotate-background "#3F3F3F")
 '(vc-annotate-color-map
   (list
    (cons 20 "#7F9F7F")
    (cons 40 "#a4b48f")
    (cons 60 "#cac99f")
    (cons 80 "#F0DFAF")
    (cons 100 "#eacfa4")
    (cons 120 "#e4bf99")
    (cons 140 "#DFAF8F")
    (cons 160 "#dea3a0")
    (cons 180 "#dd97b1")
    (cons 200 "#DC8CC3")
    (cons 220 "#d68eb3")
    (cons 240 "#d190a3")
    (cons 260 "#CC9393")
    (cons 280 "#ab8080")
    (cons 300 "#8a6d6d")
    (cons 320 "#695b5b")
    (cons 340 "#4F4F4F")
    (cons 360 "#4F4F4F")))
 '(vc-annotate-very-old-color nil)
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
 '(blamer-face ((t :foreground "#7a88cf" :background nil :height 140 :italic t)) t)
 '(font-lock-punctuation ((t (:inherit diff-changed :foreground "plum1"))) t)
 '(org-level-4 ((t (:inherit org-level-3 :extend t :foreground "orchid3" :height 0.95))))
 '(org-level-5 ((t (:inherit org-level-3 :foreground "SkyBlue2"))))
 '(org-level-6 ((t (:inherit org-level-3 :foreground "goldenrod2"))))
 '(org-level-8 ((t (:foreground "NavajoWhite3" :weight semi-bold)))))

;; don't disable narrow-to-region
(put 'narrow-to-region 'disabled nil)
