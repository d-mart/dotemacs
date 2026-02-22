;; -*- lexical-binding: nil; -*-
;; customization stuff made by emacs's customization UI

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-term-color-vector
   [unspecified "#FFFFFF" "#d15120" "#5f9411" "#d2ad00" "#6b82a7"
                "#a66bab" "#6b82a7" "#505050"] t)
 '(beacon-color "#ec4780")
 '(clojure-indent-style 'always-indent)
 '(company-quickhelp-color-background "#4F4F4F")
 '(company-quickhelp-color-foreground "#DCDCCC")
 '(compilation-message-face 'default)
 '(custom-enabled-themes nil)
 '(custom-safe-themes '(default))
 '(diary-entry-marker 'font-lock-variable-name-face)
 '(diff-hl-show-hunk-posframe-internal-border-color "#ffffffffffff")
 '(ediff-diff-options "-w" t)
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
 '(magit-diff-use-overlays nil)
 '(magit-log-arguments '("--color" "--decorate" "-n256"))
 '(magit-use-overlays nil)
 '(main-line-color1 "#1E1E1E")
 '(main-line-color2 "#111111")
 '(main-line-separator-style 'chamfer)
 '(mlscroll-in-color "#e67fe67fe67f")
 '(mlscroll-out-color "#FAFAFA")
 '(nrepl-message-colors
   '("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3"
     "#94BFF3" "#DC8CC3"))
 '(package-selected-packages
   '(0xc abyss-theme ace-isearch ace-jump-buffer ace-mc ace-window affe
         afternoon-theme ahungry-theme ai-code alchemist alect-themes
         all-the-icons-dired all-the-icons-ibuffer all-the-icons-ivy
         all-the-icons-ivy-rich ample-theme ample-zen-theme amx
         android-mode anti-zenburn-theme atom-dark-theme
         atom-one-dark-theme auto-indent-mode auto-yasnippet beacon
         better-shell bind-chord bm bpr browse-kill-ring buffer-move
         buffer-watcher bufler catppuccin-theme chronos cider circe
         circleci-api cmake-mode code-library code-review color-moccur
         commander comment-dwim-2 consult-dir copilot copilot-chat
         corral counsel-dash counsel-jq counsel-projectile crdt crux
         csv-mode cyberpunk-theme cycle-resize darcula-theme
         dark-krystal-theme dark-mint-theme dark-souls darkmine-theme
         darkokai-theme darktooth-theme dart-mode dart-server deadgrep
         devdocs-browser diminish dired-filter dired-git dired-narrow
         dired-sidebar diredc direnv dirvish distinguished-theme dkl
         docker docker-compose-mode docker-tramp dockerfile-mode
         doom-modeline doom-themes dotenv-mode dream-theme dumb-diff
         dumb-jump easy-kill edts elcontext elisp-slime-nav
         elixir-yasnippets elmacro eshell-autojump
         eshell-prompt-extras eshell-syntax-highlighting eshell-z
         exec-path-from-shell expand-region fzf go-mode gptel-agent
         hide-lines highlight-numbers hlinum ibuffer-git ibuffer-tramp
         ibuffer-vc ido-completing-read+ js2-mode json-mode lua-mode
         ns-auto-titlebar ob-chatgpt-shell ob-restclient ob-sql-mode
         org-bullets peep-dired plantuml-mode posframe rspec-mode
         smartparens sml-modeline typescript-mode urgrep visual-regexp
         web-mode-edit-element zzz-to-char))
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
   '(".wy" ".by" ".[ch]\\(\\+\\+\\|pp\\|c\\|h\\|xx\\)?"
     ".tex\\(i\\(nfo\\)?\\)?" ".el" ".emacs" ".l" ".lsp" ".p" ".java"
     ".f\\(90\\|77\\|or\\)?" ".ada" ".p[lm]" ".tcl" ".m" ".scm" ".pm"
     ".py" ".g" ".s?html" ".ma?k" "[Mm]akefile\\(\\.in\\)?" ".feature"
     "Rakefile" ".rb" ".yml"))
 '(tabbar-background-color "#353535")
 '(term-buffer-maximum-size 0)
 '(weechat-color-list
   (unspecified "#242728" "#323342" "#F70057" "#ff0066" "#86C30D"
                "#63de5d" "#BEB244" "#E6DB74" "#40CAE4" "#06d8ff"
                "#FF61FF" "#ff8eff" "#00b2ac" "#53f2dc" "#f8fbfc"
                "#ffffff"))
 '(xterm-color-names
   ["#414E63" "#CC71D1" "#88D6CB" "#C79474" "#76A2D1" "#4A4B6B" "#96A9D6"
    "#8E95A3"])
 '(xterm-color-names-bright
   ["#555B77" "#E074DB" "#8BE8D8" "#B2DEC1" "#75B5EB" "#9198EB" "#C3C3E8"
    "#838791"]))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-punctuation ((t (:inherit diff-changed :foreground "plum1"))) t)
 '(org-level-4 ((t (:inherit org-level-3 :extend t :foreground "orchid3" :height 0.95))))
 '(org-level-5 ((t (:inherit org-level-3 :foreground "SkyBlue2"))))
 '(org-level-6 ((t (:inherit org-level-3 :foreground "goldenrod2"))))
 '(org-level-8 ((t (:foreground "NavajoWhite3" :weight semi-bold)))))

;; don't disable narrow-to-region
(put 'narrow-to-region 'disabled nil)
