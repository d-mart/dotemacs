;; customization stuff made by emacs's customization UI

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ahk-syntax-directory "~/.emacs.d/plugins/ahk-mode-support/")
 '(ansi-term-color-vector
   [unspecified "#FFFFFF" "#d15120" "#5f9411" "#d2ad00" "#6b82a7" "#a66bab" "#6b82a7" "#505050"] t)
 '(browse-url-browser-function (quote browse-url-firefox))
 '(custom-enabled-themes (quote (monokai)))
 '(custom-safe-themes
   (quote
    ("4e262566c3d57706c70e403d440146a5440de056dfaeb3062f004da1711d83fc" default)))
 '(debug-on-error nil)
 '(ediff-diff-options "-w")
 '(fci-rule-character-color "#d9d9d9")
 '(fci-rule-color "#383838")
 '(fringe-mode (quote (0)) nil (fringe))
 '(hl-paren-colors
   (quote
    ("firebrick1" "DarkOrange2" "yellow3" "green2" "blue1" "DarkOrchid3")))
 '(icicle-mode t)
 '(indicate-buffer-boundaries (quote right))
 '(indicate-empty-lines t)
 '(magit-use-overlays nil)
 '(package-selected-packages
   (quote
    (elixir-mode planet-theme racket-mode zonokai-theme avy helm-dash helm-mt multi-term marcopolo kerl rpn-calc highlight-indentation apropospriate-theme hydra mellow-theme moe-theme darktooth-theme material-theme swiper ztree zenburn-theme zen-and-art-theme yari yaml-mode wgrep warm-night-theme visual-regexp-steroids vagrant use-package undo-tree twilight-theme twilight-bright-theme twilight-anti-bright-theme toxi-theme swoop sunrise-commander subatomic256-theme string-utils spacegray-theme soothe-theme sml-modeline smex smartparens seti-theme scss-mode sane-term rvm rust-mode ruby-tools ruby-interpolation ruby-electric ruby-block ruby-additional rspec-mode roguel-ike robe rinari reverse-theme restclient rainbow-delimiters railscasts-theme rails-log-mode protobuf-mode projectile-rails pow phoenix-dark-pink-theme phi-search-mc phi-search-dired phi-grep peep-dired pallet noccur neotree naquadah-theme move-line monokai-theme molokai-theme mode-line-debug mc-extras math-at-point markdown-mode+ mark-multiple mark-more-like-this magit-push-remote lush-theme lua-mode lfe-mode key-chord json-mode js2-mode jg-quicknav jabber ir-black-theme info+ impatient-mode iflipb iedit ibuffer-vc ibuffer-tramp ibuffer-git hlinum highlight-parentheses highlight-numbers hide-lines heroku-theme helm-themes helm-rb helm-rails helm-projectile-all helm-projectile helm-ls-git helm-helm-commands helm-git-grep helm-ag haste haml-mode hackernews guru-mode grandshell-theme go-mode gitignore-mode gitconfig-mode git-timemachine git-messenger free-keys flx-ido flatui-theme firebelly-theme fiplr feature-mode expand-region etags-select es-lib elisp-slime-nav edts easy-kill dockerfile-mode dired+ darkmine-theme dark-souls cycle-resize cyberpunk-theme coffee-mode browse-kill-ring bm awk-it auto-yasnippet auto-indent-mode auto-complete-etags anti-zenburn-theme android-mode ag afternoon-theme ace-jump-buffer ace-isearch)))
 '(remote-shell-program "ssh")
 '(smartparens-global-mode t)
 '(speedbar-supported-extension-expressions
   (quote
    (".wy" ".by" ".[ch]\\(\\+\\+\\|pp\\|c\\|h\\|xx\\)?" ".tex\\(i\\(nfo\\)?\\)?" ".el" ".emacs" ".l" ".lsp" ".p" ".java" ".f\\(90\\|77\\|or\\)?" ".ada" ".p[lm]" ".tcl" ".m" ".scm" ".pm" ".py" ".g" ".s?html" ".ma?k" "[Mm]akefile\\(\\.in\\)?" ".feature" "Rakefile" ".rb" ".yml")))
 '(term-buffer-maximum-size 0))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(bm-face ((t (:box (:line-width 2 :color "DeepSkyBlue1" :style released-button)))))
 '(bm-fringe-face ((t (:box (:line-width 2 :color "DeepSkyBlue1" :style released-button)))))
 '(flx-highlight-face ((t (:inherit font-lock-variable-name-face :foreground "deep sky blue" :underline t :weight semi-bold))))
 '(font-lock-punctuation ((t (:inherit diff-changed :foreground "plum1"))) t)
 '(linum-highlight-face ((t (:inherit default :foreground "green1"))))
 '(woman-bold ((t (:inherit bold :foreground "dodger blue"))))
 '(woman-italic ((t (:foreground "gold2")))))

;; don't disable narrow-to-region
(put 'narrow-to-region 'disabled nil)
