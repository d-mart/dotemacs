;; -----------------
;; Key Bindings
;; -----------------
(global-set-key [C-delete]      'kill-word)
(global-set-key [C-backspace]   'backward-kill-word)
(global-set-key [home]          'beginning-of-line)
(global-set-key [end]           'end-of-line)
(global-set-key [C-home]        'beginning-of-buffer)
(global-set-key [C-end]         'end-of-buffer)
(global-set-key [C-f2]          'bm-toggle)
(global-set-key [f2]            'bm-next)
(global-set-key [S-f2]          'bm-previous)
(global-set-key [f3]            'generalized-shell-command)
(global-set-key [f4]            'switch-to-or-create-shell)
(global-set-key [f6]            '(lambda ()  (interactive) (revert-buffer t t) (message "Reverted."))) ;; lifted from dadams 'revert-buffer-no-confirm
(global-set-key [S-f6]          '(lambda () (interactive) (kill-buffer (current-buffer))))
(global-set-key [C-f6]          'revert-all-buffers)
(global-set-key [s-f6]          'nuke-all-buffers)     ;; Win-F6 - kill all buffers
(global-set-key [f7]            'next-error)
(global-set-key [S-f7]          'recompile)
(global-set-key [C-f7]          'kill-compilation)
(global-set-key [f8]            'xah-search-current-word)
; I hate when tryying to hold down C-p, i instead hold down C-[,
; and my window layout is ruined.  Intercep!
(global-set-key (kbd "ESC ESC ESC") '(lambda () (interactive) (message "Whoopsie!")))

; helm - incrementally search files, buffers, and more
(global-set-key (kbd "s-h") 'helm-mini)

; a few more version-control bindings
(global-set-key (kbd "C-x v e") 'ediff-revision)
(global-set-key (kbd "C-x v f") 'vc-git-grep)

;; Hide and show lines matching regex
(global-set-key (kbd "C-c h")   'hide-lines)
(global-set-key (kbd "C-c H")   'show-all-invisible)

; toggle two windows between being split horizontally and vertically
(global-set-key (kbd "C-|")     'toggle-window-split)
; ace-jump-mode
(global-set-key (kbd "C-c SPC") 'ace-jump-mode)
; make a window stick with a buffer
(global-set-key [C-pause]       'toggle-window-dedicated)
; Describe last function - for when you want to know wtf emacs just did
(global-set-key (kbd "C-h z")   'describe-last-function)
; Jump to definition of function
(global-set-key (kbd "C-h C-f") 'find-function)
; Kill from point to beginning of line - (this binding replaces kill-sentence which I don't use)
(global-set-key (kbd "M-k")     'kill-start-of-line)
; kill word to left of point
(global-set-key (kbd "M-D")     'backward-kill-word)
; bounce back and forth between beginning of line and beginning of text
(global-set-key (kbd "C-a")     'back-to-indentation-or-beginning)
; Use etags-select-find-tag for more functionality (replaces find-tag)
(global-set-key (kbd "M-.")     'etags-select-find-tag-at-point)
(global-set-key (kbd "M-?")     'etags-select-find-tag)
(global-set-key (kbd "C->")     'etags-select-goto-tag-other-window)
;; move by paragraph - useful when region-ing a block of codez - don't take hands of regular area
(global-set-key (kbd "C-S-n")   'forward-paragraph)
(global-set-key (kbd "C-S-p")   'backward-paragraph)

(global-set-key (kbd "C-x ,")   'find-file-in-tags)
;(global-set-key (kbd "C-x C-b")  'electric-buffer-list)
; Make Emacs use "newline-and-indent" when you hit the Enter key so
; that you don't need to keep using TAB to align yourself when coding.
(global-set-key (kbd "C-m")     'newline-and-indent)
; fill paragraph - wrap lines to a column width including inside comments
(global-set-key (kbd "M-p")     'fill-paragraph)
;; toggle back and forth between speedbar
(global-set-key (kbd "C-c s")   'speedbar-get-focus)
;; show neotree folder sidebar
(global-set-key (kbd "s-s")     'neotree-show)
;; find files containing a regex.  Send list of files to a dired buffer
(global-set-key (kbd "C-c G")   'find-grep-dired)
;; find file names by regexp and send results to dired buffer
(global-set-key (kbd "C-c f")   'find-name-dired)
;; delete all trailing whitespace in a buffer
(global-set-key (kbd "C-c d")   'delete-trailing-whitespace)
;; run icicles-occur - show lines in buffer matching regex
(global-set-key (kbd "C-c o")   'icicle-occur)
;; kill any directory listing buffers to reduce clutter
(global-set-key (kbd "C-c C-d") 'kill-all-dired-buffers)
;; org interaction bindings
(global-set-key (kbd "C-c l")   'org-store-link)
(global-set-key (kbd "C-c a")   'org-agenda)
;; toggle truncate lines (aka line-wrap)
(global-set-key (kbd "C-c t")   'toggle-truncate-lines)
;; insert a timestamp at point
(global-set-key (kbd "C-S-c t") 'insert-time-string)
;; eval region (I seem to use it a lot)
(global-set-key (kbd "C-c C-e") 'eval-region)
;; another binding for transpose lines (gnome steals C-M-t for launch terminal)
(global-set-key (kbd "C-S-t")   'transpose-lines)
;; having to switch to M- (off of C-) for kill-ring-save seems to interrupt my flow alot
;; move seldomly-used quoted-insert and take its keybinding for kill-ring-save
(global-set-key (kbd "C-q")     'kill-ring-save)
(global-set-key (kbd "C-c q")   'quoted-insert)
;; iswitchb
; using this with autoindent mode now (global-set-key (kbd "<M-RET>") 'iswitchb-buffer)
;; hippie-expand
(global-set-key (kbd "M-/")     'hippie-expand)
;; backwards zap to char
(global-set-key (kbd "M-Z")     'backward-zap-to-char)
;; see list of killed text
(global-set-key (kbd "C-c k")   'browse-kill-ring)
;; lusty
(global-set-key (kbd "C-c C-f") 'lusty-file-explorer)
(global-set-key (kbd "C-c C-b") 'lusty-buffer-explorer)
;; temp - buff-menu is being interfered with by some other package - use ibuffer for now
(global-set-key (kbd "C-x C-b") 'ibuffer)
;; temp - iswitchb bombs if an SGML HTML buffer is open
(global-set-key (kbd "C-x b")   'ido-switch-buffer)
(global-set-key (kbd "C-x C-f") 'ido-find-file)

(global-set-key (kbd "C-c b")   'bury-buffer)
;; insert '%' unless cursor just moved AND next to a paren/brace/bracket
;;; -br0ken (global-set-key (kbd "%")       'goto-match-paren)
;; iflipb bindings
(global-set-key (kbd "<C-tab>") 'iflipb-next-buffer)
(global-set-key
 (if (featurep 'xemacs) (kbd "<C-iso-left-tab>") (kbd "<C-S-iso-lefttab>"))
  'iflipb-previous-buffer)

;; Turn Control-z into another keymap.  The previous binding becomes
;; `Control-z Control-z'.
(defvar ctrl-z-map (make-sparse-keymap))
(let ((orig-ctrl-z-binding (lookup-key (current-global-map) (kbd "C-z"))))
  (global-set-key (kbd "C-z") ctrl-z-map)
  (global-set-key (kbd "C-z C-z") orig-ctrl-z-binding))

;; A safer exit keybind.
(global-set-key (kbd "C-x C-c")
  (lambda ()
   (interactive)
   (if (y-or-n-p-with-timeout "Do you really want to exit Emacs? " 4 nil)
       (save-buffers-kill-emacs))))

;;; Keybindings for mac
;; make super-c, super-v, super-x do copy, paste, cut
(if (eq system-type 'darwin)
    (progn
      (global-set-key (kbd "s-c") 'kill-ring-save)
      (global-set-key (kbd "s-v") 'cua-paste)
      (global-set-key (kbd "s-x") 'kill-region)))
