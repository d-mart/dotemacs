;; customization stuff made by emacs's customization UI

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(Linum-format "%7i ")
 '(ahk-syntax-directory "~/.emacs.d/plugins/ahk-mode-support/")
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   ["#424242" "#EF9A9A" "#C5E1A5" "#FFEE58" "#64B5F6" "#E1BEE7" "#80DEEA" "#E0E0E0"])
 '(ansi-term-color-vector
   [unspecified "#FFFFFF" "#d15120" "#5f9411" "#d2ad00" "#6b82a7" "#a66bab" "#6b82a7" "#505050"] t)
 '(compilation-message-face (quote default))
 '(custom-enabled-themes (quote (apropospriate-dark)))
 '(custom-safe-themes
   (quote
    ("5a0eee1070a4fc64268f008a4c7abfda32d912118e080e18c3c865ef864d1bea" "4e262566c3d57706c70e403d440146a5440de056dfaeb3062f004da1711d83fc" default)))
 '(debug-on-error nil)
 '(diary-entry-marker (quote font-lock-variable-name-face))
 '(ediff-diff-options "-w" t)
 '(fci-rule-character-color "#d9d9d9")
 '(fci-rule-color "#c7c7c7")
 '(fringe-mode (quote (0)) nil (fringe))
 '(global-git-commit-mode t)
 '(highlight-changes-colors (quote ("#FD5FF0" "#AE81FF")))
 '(highlight-symbol-colors
   (quote
    ("#FFEE58" "#C5E1A5" "#80DEEA" "#64B5F6" "#E1BEE7" "#FFCC80")))
 '(highlight-symbol-foreground-color "#E0E0E0")
 '(highlight-tail-colors
   (if
       (eq
        (quote dark)
        (quote light))
       (quote
        (("#FFA726" . 0)
         ("#FFEE58" . 10)
         ("#FFF59D" . 30)
         ("#494949" . 60)
         ("#424242" . 80)))
     (quote
      (("#F8BBD0" . 0)
       ("#FF80AB" . 10)
       ("#9575CD" . 30)
       ("#494949" . 60)
       ("#424242" . 80)))))
 '(hl-paren-background-colors (quote ("#2492db" "#95a5a6" nil)))
 '(hl-paren-colors
   (quote
    ("firebrick1" "DarkOrange2" "yellow3" "green2" "blue1" "DarkOrchid3")))
 '(icicle-mode t)
 '(indicate-buffer-boundaries (quote right))
 '(indicate-empty-lines t)
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
    (which-key f3 forest-blue-theme gotham-theme darkokai-theme moonscript redtick helm-c-moccur moccur-edit zoom-frm 0blayout counsel ace-mc dark-mint-theme try buffer-move ggtags helm-gtags dumb-jump omtose-phellack-theme fireplace firestarter flycheck-clangcheck comment-dwim-2 zzz-to-char zone-rainbow magit s elixir-yasnippets elixir-mix slack sublime-themes sift highlight-indent-guides code-library darcula-theme dark-krystal-theme darkburn-theme slim-mode termbright-theme pastelmac-theme helm-grepint helm-fuzzier bpr jenkins beacon abyss-theme emacsql-mysql scratches tab-jump-out use-package-chords spaceline subemacs smart-region w3m atom-one-dark-theme atom-dark-theme skewer-mode async ahungry-theme org-wunderlist org-sync aurora-theme color-moccur emacsql turnip emamux zerodark-theme kaesar-mode kaesar-file kaesar dart-mode avy-zap rainbow-mode alchemist alect-themes ample-theme ample-zen-theme eshell-prompt-extras eshell-z fasd eno auto-complete company helm projectile company-inf-ruby peek-mode ace-window pomodoro protobuf-mode recompile-on-save help-mode+ help-fns+ redis ace-jump-helm-line package-safe-delete corral elixir-mode planet-theme racket-mode zonokai-theme avy helm-dash helm-mt multi-term marcopolo kerl rpn-calc highlight-indentation apropospriate-theme hydra mellow-theme moe-theme darktooth-theme material-theme swiper ztree zenburn-theme zen-and-art-theme yari yaml-mode wgrep warm-night-theme visual-regexp-steroids vagrant use-package undo-tree twilight-theme twilight-bright-theme twilight-anti-bright-theme toxi-theme swoop sunrise-commander subatomic256-theme string-utils spacegray-theme soothe-theme sml-modeline smex smartparens seti-theme scss-mode sane-term rvm rust-mode ruby-tools ruby-interpolation ruby-electric ruby-block ruby-additional rspec-mode roguel-ike rinari reverse-theme restclient rainbow-delimiters railscasts-theme rails-log-mode projectile-rails pow phoenix-dark-pink-theme phi-search-mc phi-search-dired phi-grep peep-dired pallet noccur neotree naquadah-theme move-line monokai-theme molokai-theme mode-line-debug mc-extras math-at-point markdown-mode+ mark-multiple mark-more-like-this magit-push-remote lush-theme lua-mode lfe-mode key-chord json-mode js2-mode jg-quicknav jabber ir-black-theme info+ impatient-mode iflipb iedit ibuffer-vc ibuffer-tramp ibuffer-git hlinum highlight-parentheses highlight-numbers hide-lines heroku-theme helm-themes helm-rb helm-rails helm-projectile-all helm-projectile helm-ls-git helm-helm-commands helm-git-grep helm-ag haste haml-mode hackernews guru-mode grandshell-theme go-mode gitignore-mode gitconfig-mode git-timemachine git-messenger free-keys flx-ido flatui-theme firebelly-theme fiplr feature-mode expand-region etags-select es-lib elisp-slime-nav edts easy-kill dockerfile-mode dired+ darkmine-theme dark-souls cycle-resize cyberpunk-theme coffee-mode browse-kill-ring bm awk-it auto-yasnippet auto-indent-mode auto-complete-etags anti-zenburn-theme android-mode ag afternoon-theme ace-jump-buffer ace-isearch)))
 '(pos-tip-background-color "#36473A")
 '(pos-tip-foreground-color "#FFFFC8")
 '(remote-shell-program "ssh")
 '(speedbar-supported-extension-expressions
   (quote
    (".wy" ".by" ".[ch]\\(\\+\\+\\|pp\\|c\\|h\\|xx\\)?" ".tex\\(i\\(nfo\\)?\\)?" ".el" ".emacs" ".l" ".lsp" ".p" ".java" ".f\\(90\\|77\\|or\\)?" ".ada" ".p[lm]" ".tcl" ".m" ".scm" ".pm" ".py" ".g" ".s?html" ".ma?k" "[Mm]akefile\\(\\.in\\)?" ".feature" "Rakefile" ".rb" ".yml")))
 '(term-buffer-maximum-size 0)
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#F92672")
     (40 . "#CF4F1F")
     (60 . "#C26C0F")
     (80 . "#E6DB74")
     (100 . "#AB8C00")
     (120 . "#A18F00")
     (140 . "#989200")
     (160 . "#8E9500")
     (180 . "#A6E22E")
     (200 . "#729A1E")
     (220 . "#609C3C")
     (240 . "#4E9D5B")
     (260 . "#3C9F79")
     (280 . "#A1EFE4")
     (300 . "#299BA6")
     (320 . "#2896B5")
     (340 . "#2790C3")
     (360 . "#66D9EF"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (unspecified "#272822" "#49483E" "#A20C41" "#F92672" "#67930F" "#A6E22E" "#968B26" "#E6DB74" "#21889B" "#66D9EF" "#A41F99" "#FD5FF0" "#349B8D" "#A1EFE4" "#F8F8F2" "#F8F8F0")))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(bm-face ((t (:box (:line-width 2 :color "DeepSkyBlue1" :style released-button)))))
 '(bm-fringe-face ((t (:box (:line-width 2 :color "DeepSkyBlue1" :style released-button)))))
 '(flx-highlight-face ((t (:inherit font-lock-variable-name-face :foreground "deep sky blue" :underline t :weight semi-bold))))
 '(font-lock-punctuation ((t (:inherit diff-changed :foreground "plum1"))) t)
 '(linum-highlight-face ((t (:foreground "gray100"))))
 '(region ((t (:background "burlywood1" :foreground "#272822"))))
 '(woman-bold ((t (:inherit bold :foreground "dodger blue"))))
 '(woman-italic ((t (:foreground "gold2")))))

;; don't disable narrow-to-region
(put 'narrow-to-region 'disabled nil)
