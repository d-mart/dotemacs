
;; NOTES
;;-To byte-compile all elisp files in current directory and below:
;;   C-u 0 M-x byte-recompile-directory
;;   (The C-u 0 makes it not ask for every file)
;;-(diff-buffer-with-file)
;;-smerge to eat diff3 output

;; save emacs (customize-xxxx) changes their own file
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

;; look under .emacs.d for packages
(let ((default-directory "~/.emacs.d"))
  (normal-top-level-add-subdirs-to-load-path))

;; set up default location for emacs-themes
(setq custom-theme-directory "~/.emacs.d/themes")

;;------------------
;; Error handling macro
;; From https://curiousprogrammer.wordpress.com/2009/06/08/error-handling-in-emacs-lisp/
;;------------------
(defmacro safe-wrap (fn &rest clean-up)
  `(unwind-protect
       (let (retval)
         (condition-case ex
             (setq retval (progn ,fn))
           ('error
            (message (format "Caught exception: [%s]" ex))
            (setq retval (cons 'exception (list ex)))))
         retval)
     ,@clean-up))


;;------------------
;; Load modules
;;------------------

;; el-get - fetch emacs addons and keep them up to date
;;(if (= emacs-major-version 24)
;  (unless (require 'el-get nil t)
;    (url-retrieve
;     "https://raw.github.com/dimitri/el-get/master/el-get-install.el"
;     (lambda (s)
;       (end-of-buffer)
;       (eval-print-last-sexp))))
;
;(el-get 'sync)
(require 'el-get)


(require 'protobuf-mode)
;(autoload 'protobuf-mode "protobuf"
;          "Google Protocol Buffers syntax hilighting" t)
(autoload 'magit-status "magit"
          "Magit emacs git interface" t)
(autoload 'yaml-mode "yaml-mode"
          "YAML syntax highlighting")
(autoload 'clojure-mode "clojure-mode"
          "Clojure syntax highlighting")
(autoload 'feature-mode "feature-mode"
          "Cucumber feature mode for emacs" t)
(autoload 'git-commit-mode "git-commit-mode"
          "git commit message editing mode" t)
(autoload 'ahk-mode "ahk-mode"
          "major mode for AutoHotKey" t)

;; functions and settings for working with tags
;; (specific to projects I'm working on)
(load-library "tag-utils.el")

;; Set up color themes for console vs X
;(add-hook 'after-make-frame-functions
;  '(lambda (f)
;  (with-selected-frame f

;; ido - interactively do stuff - great flex matching for possible completions in input
(setq ido-enable-flex-matching t)
;(ido-mode)
; from http://chopmo.blogspot.com/2008/09/quickly-jumping-to-symbols.html
(defun ido-goto-symbol ()
  "Will update the imenu index and then use ido to select a
   symbol to navigate to"
  (interactive)
  (imenu--make-index-alist)
  (let ((name-and-pos '())
        (symbol-names '()))
    (flet ((addsymbols (symbol-list)
                       (when (listp symbol-list)
                         (dolist (symbol symbol-list)
                           (let ((name nil) (position nil))
                             (cond
                              ((and (listp symbol) (imenu--subalist-p symbol))
                               (addsymbols symbol))

                              ((listp symbol)
                               (setq name (car symbol))
                               (setq position (cdr symbol)))

                              ((stringp symbol)
                               (setq name symbol)
                               (setq position (get-text-property 1 'org-imenu-marker symbol))))

                             (unless (or (null position) (null name))
                               (add-to-list 'symbol-names name)
                               (add-to-list 'name-and-pos (cons name position))))))))
      (addsymbols imenu--index-alist))
    (let* ((selected-symbol (ido-completing-read "Symbol? " symbol-names))
           (position (cdr (assoc selected-symbol name-and-pos))))
      (goto-char position))))

;; buffer-move - great way to move buffers in windows easily
(load-library "buffer-move")

;; icicles - “In case you never heard of it, Icicles is to ‘TAB’ completion what ‘TAB’ completion is to typing things manually every time.”
(load-library "icicles.el")
(icy-mode)
;; a little work around - kill-buffer gets mapped to icicle-kill-buffer.
;; BUT that calls (in some cases) kill-buffer-and-its-windows, which I fucking hate
(defalias 'kill-buffer-and-its-windows 'kill-buffer)

;; enhancements to compile mode
;(require 'compile+)

;; uniquify - makes buffer names for files of same name more useful.
;; e.g. instead of foo.c and foo.c<2>, foo.c|dir1 and foo.c|dir2
(require 'uniquify)
(setq uniquify-buffer-name-style 'reverse)
(setq uniquify-separator "/")
(setq uniquify-after-kill-buffer-p t) ; rename after killing uniquified
(setq uniquify-ignore-buffers-re "^\\*") ; don't muck with special buffers

;; dired+ - Lots of improvements to dir listing buffers
(require 'dired+)

;; buffer-menu+ - Lots of improvements to buffer list
; require doesn't work - load instead (require 'buff-menu+)
(load-library "buff-menu+.el")

;; autocomplete - learning, completion-showing extension
(require 'auto-complete-config)
(require 'auto-complete-etags)
(setq ac-stop-words '("/" "//"))  ; don't autocomplete C comments

(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-1.4.20110207/dict")
(ac-config-default)

;; Browse kill ring - see list of text that has been killed
(require 'browse-kill-ring)

; anything - search different types of data (e.g. command names, files, stuff in buffers)
;(require 'anything)
;(require 'anything-dired-history)
;(require 'anything-etags+)

;; Highlight the parens cursor is within
(require 'highlight-parentheses)
(highlight-parentheses-mode)

;; autoindent mode -
;;  (1) Return automatically indents the code appropriately (if enabled)
;;  (2) Pasting/Yanking indents the appropriately
;;  (3) Killing line will take off unneeded spaces (if enabled)
;;  (4) On visit file, indent appropriately, but DONT SAVE. (Pretend like
;;  nothing happened, if enabled)
;;  (5) On save, optionally unttabify, remove trailing white-spaces, and
;;  definitely indent the file (if enabled).
;;  (6) TextMate behavior of keys if desired (see below)
;;  (7) Deleting the end of a line will shrink the whitespace to just
;;  one (if desired and enabled)
(setq auto-indent-key-for-end-of-line-then-newline "<M-return>")
(setq auto-indent-key-for-end-of-line-insert-char-then-newline "<M-S-return>")
(setq auto-indent-on-visit-file nil) ;; t If you want auto-indent on for files
(setq auto-indent-on-visit-pretend-nothing-changed nil) ;; don't mess with files when they're opened
(setq auto-indent-blank-lines-on-move nil)  ;; this messes up visited-only files
(setq auto-indent-delete-line-char-remove-extra-spaces t) ;; when deleting a line-ending, remove whitespace between newly joined lines
(setq auto-indent-use-text-boundaries t) ;; if point is before text, kill like point was at BOL
(require 'auto-indent-mode)
(auto-indent-global-mode)

;; autopair mode - automatically close quotes, parens, braces, etc
(require 'autopair)
(setq autopair-autowrap 't)

;; auto-pair+ - wrap selection in matched pairs
;(require 'auto-pair+)

;; more paren stuff
(load-library "parens-utils.el")

;; make a stack of buffers a la alt-tab
;; key-bindings not set within, see below
(require 'iflipb)

;; bookmarks - visible and possibly persistent bookmarks
(require 'bm)

;; rsense - autocomplete / type tools for ruby
;; NOTE - a software package must be installed and configured for this to work
;; @todo - make below setting expand more automagically
;(setq rsense-home "/home/dmartinez/proj/stuff/utils/rsense")
;(require 'rsense)

;; findr - search for files breadth-first
;; (autoload 'findr "findr" "Find file name." t)
;; (define-key global-map [(meta control S)] 'findr)

;; (autoload 'findr-search "findr" "Find text in files." t)
;; (define-key global-map [(meta control s)] 'findr-search)

;; (autoload 'findr-query-replace "findr" "Replace text in files." t)
;; (define-key global-map [(meta control r)] 'findr-query-replace)

;; iswitchb mode - easily and quickly switch between buffers
(iswitchb-mode)
;; set iswitchb to show whatever buffer i switch to in the current window
(setq iswitchb-default-method 'samewindow)
;;(iswitchb-default-keybindings)
(defun iswitchb-local-keys ()
      (mapc (lambda (K)
	      (let* ((key (car K)) (fun (cdr K)))
    	        (define-key iswitchb-mode-map (edmacro-parse-keys key) fun)))
	    '(("<right>" . iswitchb-next-match)
	      ("<left>"  . iswitchb-prev-match)
	      ("<up>"    . iswitchb-next-match)
	      ("<down>"  . iswitchb-prev-match))))
(add-hook 'iswitchb-define-mode-map-hook 'iswitchb-local-keys)
;; The next two functions are to make iswitchb rescan the buffer
;; names when a buffer is killed.  When two files with the same
;; name are opened, unquify adjusts the buffer names.  When one
;; of those is subsequently closed, uniquify changes the remaining
;; buffer name back to just the file name.  iswitchb must be
;; made aware of that
(defadvice iswitchb-kill-buffer (after rescan-after-kill activate)
  "*Regenerate the list of matching buffer names after a kill.
    Necessary if using `uniquify' with `uniquify-after-kill-buffer-p'
    set to non-nil."
  (setq iswitchb-buflist iswitchb-matches)
  (iswitchb-rescan))
(defun iswitchb-rescan ()
  "*Regenerate the list of matching buffer names."
  (interactive)
  (iswitchb-make-buflist iswitchb-default)
  (setq iswitchb-rescan t))
;; ignore these buffer names in the iswitchb list
(add-to-list 'iswitchb-buffer-ignore "^ ")
(add-to-list 'iswitchb-buffer-ignore "*Messages*")
(add-to-list 'iswitchb-buffer-ignore "*ECB")
(add-to-list 'iswitchb-buffer-ignore "*Buffer")
(add-to-list 'iswitchb-buffer-ignore "*Completions")
(add-to-list 'iswitchb-buffer-ignore "^[tT][aA][gG][sS]")
(add-to-list 'iswitchb-buffer-ignore "*scratch")
;; iswitchb-highlight - colorize buffer names in iswitchb list
;; based on their modes
(require 'iswitchb-highlight)

;; yasnippet - Yet Another Snippet module
(require 'yasnippet)
(yas/initialize)
(yas/load-directory "~/.emacs.d/plugins/yasnippet/snippets")

;; etags-select - look thru list of matching tags before jumping
(require 'etags-select)
; keybindings below

;; find file in tags - run (find-file-in-tags), enter filename
;; that exists in tags file, and voila - visited.
(require 'find-file-in-tags)
; keybindings below

;; lusty-explorer - file/buffer browser that's mo better
(require 'lusty-explorer)

;; key-chord - two keys pressed simultaneously cause a function to be called
(require 'key-chord)
(key-chord-mode 1)
(key-chord-define-global "jk" 'undo)
(key-chord-define-global "hj" 'hippie-expand)
(key-chord-define-global "bv" 'iswitchb-buffer)
(key-chord-define-global "cv" 'reindent-then-newline-and-indent)

;; wgrep - edit grep results right in the grep buffer and save changes to files
(require 'wgrep)

;; ace-jump-mode - type hotkey and a letter, buffer shows enumerated choice
;; of which instance of that char to jump to
(require 'ace-jump-mode)

;; hippie expand settings -
;; bound over dabbrev-expand M-/
(setq hippie-expand-try-functions-list
      '(try-expand-dabbrev
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        try-complete-file-name-partially
        try-complete-file-name
        try-expand-all-abbrevs
        try-expand-list try-expand-line
        try-complete-lisp-symbol-partially
        try-complete-lisp-symbol))

;; add some more package repositories for ELPA - DM
(cond
 ((= 24 emacs-major-version)
  (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
  (add-to-list 'package-archives '("sunrise"   . "http://joseito.republika.pl/sunrise-commander/"))
  (add-to-list 'package-archives '("ELPA"      . "http://tromey.com/elpa/"))
  (add-to-list 'package-archives '("melpa"     . "http://melpa.milkbox.net/packages/"))))


;;------------------
;; General Behavior
;;------------------
;; start emacs server so you can open files in this session from other shells
;; *unless* it's already running
(if (not (boundp 'server-process))
    (server-start)
    ;; When opening a buffer from emacsclient, don't prompt when it is killed
    (remove-hook 'kill-buffer-query-functions 'server-kill-buffer-query-function))

;; Enable recursive minibuffer
(setq enable-recursive-minibuffers t)
;; Kill minibuffer when mouse clicks somewhere else
(defun stop-using-minibuffer ()
  "kill the minibuffer"
  (when (and (>= (recursion-depth) 1) (active-minibuffer-window))
    (abort-recursive-edit)))

(add-hook 'mouse-leave-buffer-hook 'stop-using-minibuffer)

;; Easy buffer switching by holding down shift and press any arrow key.
(windmove-default-keybindings 'shift)
;; Hook framemove into windmove, i.e. if windmove can't move
;; anymore, call framemove
(require 'framemove)
(setq framemove-hook-into-windmove t)

;; Show unfinished keystrokes early.
(setq echo-keystrokes 0.1)

;; Make C-z stop minimizing frames
(defun iconify-or-deiconify-frame nil)

;; Delete the selected region when something is typed or with DEL (t => enabled)
(delete-selection-mode nil)

;; -----------------
;; TRAMP setup
;; -----------------
(setq tramp-default-method "ssh")
;(setq tramp-debug-buffer t)
(setq tramp-debug-buffer nil)
; one of these must match the prompt on remote host... not sure why first one works
(setq shell-prompt-pattern "$ ")
(setq tramp-shell-prompt-pattern "0m ")
;; - Get a warning on the modeline when editing a file as root
(defun my-mode-line-function ()
  (when (string-match "^/su\\(do\\)?:" default-directory)
    (setq mode-line-format
          (format-mode-line mode-line-format 'font-lock-warning-face))))
(add-hook 'find-file-hooks 'my-mode-line-function)
(add-hook 'dired-mode-hook 'my-mode-line-function)


;; -----------------
;; Look and Feel
;; -----------------
;; Set font.  To see what's at cursor, C-u C-x =
(defvar myFont "-unknown-DejaVu Sans Mono-normal-normal-normal-*-13-*-*-*-*-0-iso10646-1")
;(defvar myFont "-unknown-Ubuntu Mono-bold-normal-normal-*-15-*-*-*-m-0-iso10646-1")
;(defvar myFont "-monotype-Andale Mono-normal-normal-normal-*-13-*-*-*-m-0-iso10646-1")
;(defvar myFont "-monotype-Andale Mono-normal-normal-normal-*-15-*-*-*-m-0-iso10646-1")
;(defvar myFont "-adobe-courier-medium-r-normal--18-180-75-75-m-110-iso8859-1")
;(defvar myFont "-adobe-courier-medium-r-normal--17-120-100-100-m-100-iso10646-1")
;(defvar myFont ":-unknown-Droid Sans Mono-normal-normal-normal-*-13-*-*-*-m-0-iso10646-1")

(safe-wrap (set-default-font myFont))
;; set above font as default for new frame as well
;(safe-wrap (setq default-frame-alist
;      (append '((font . 'myFont)
;                (geometry . "-1-1"))
;              default-frame-alist)))

; highlight the cursor line
; M-x list-colors-display
(defface hl-line '((t (:background "#1A1A1A")))
  "Face to use for `hl-line-face'." :group 'hl-line)
(setq hl-line-face 'hl-line)
(global-hl-line-mode nil)

;; display date and time always
(setq display-time-day-and-date t)
(display-time)

;; Show column number in status bar
(setq column-number-mode t)

;; C-k kills whole line and newline if at beginning of line
(setq kill-whole-line t)

;; Always add a final newline
(setq require-trailing-newline t)

;; enable the upcase-region and downcase-region commands
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;; Scrollbar on the right
;(set-scroll-bar-mode 'right)
;; No scrollbar
(scroll-bar-mode -1)

;; prevent find and grep folders from changing automatically
;;(add-hook 'find-file-hook
;;          (lambda ()
;;            (setq default-directory command-line-default-directory)))

;; automatically follow symlinks into version-controlled files instead of asking
(setq vc-follow-symlinks t)

;; blink matching paren when closing
(setq blink-matching-paren t)
;; ... and at cursor
(show-paren-mode t)

;; don't display toolbar and menubar (this is emacs after all...)
(tool-bar-mode -1)
(menu-bar-mode -1)

;; always re-read the TAGS file if it's changed without asking
(setq tags-revert-without-query t)

;; Emacs will not automatically add new lines
(setq next-line-add-newlines nil)

;; compilation buffer scrolls with output instead
;; of sitting at the top of the output
(setq compilation-scroll-output t)
;; to make next-error etc skip anything less important than an error
;; to show warnings and errors, set to 1
(setq compilation-skip-threshold 2)
;; from stackoverflow.com, set line truncation on in compilation buffers
(defun my-compilation-mode-hook ()
  (setq truncate-lines nil) ;; automatically becomes buffer local
  (set (make-local-variable 'truncate-partial-width-windows) nil))
(add-hook 'compilation-mode-hook 'my-compilation-mode-hook)

;; gdb
(defun my-gdb-mode-hook ()
  (setq gdb-prompt-name "[gdb] "))
(add-hook 'gud-mode-hook 'my-gdb-mode-hook)

;; disable line wrap
(setq-default truncate-lines t)

;; disable annoying emacs splash screen
(setq inhibit-splash-screen t)

;; Changes all yes/no questions to y/n type
(fset 'yes-or-no-p 'y-or-n-p)

;; Scroll down with the cursor,move down the buffer one
;; line at a time, instead of in larger amounts.
(setq scroll-step 1)
;; actually like this better
(setq scroll-step 10)

;; default size and location
(add-to-list 'default-frame-alist '(left . 0))
(add-to-list 'default-frame-alist '(top . 0))
(add-to-list 'default-frame-alist '(height . 60))
(add-to-list 'default-frame-alist '(width . 155))

;; titlebar = buffer unless filename
(setq frame-title-format '(buffer-file-name "emacs - %f" ("emacs - %b")))

;; Drive out the mouse when it's too near to the cursor.
(mouse-avoidance-mode 'animate)

;; cursor is a line instead of block
(setq-default cursor-type '(bar . 1))

;; make split-window-vertically put next buffer in new window
(defadvice split-window-vertically
  (after my-window-splitting-advice first () activate)
  (set-window-buffer (next-window) (other-buffer)))

;; ediff setup
(custom-set-variables
 ; ignore whitespace
 '(ediff-diff-options "-w")
 ; diff side-by-side isntead of over-and-under
 '(ediff-split-window-function (quote split-window-horizontally))
 ; hide little popup window
 '(ediff-window-setup-function (quote ediff-setup-windows-plain)))

;; cua mode (rectangle only)
(setq cua-enable-cua-keys nil)
(cua-mode)

;;; ------------
;;; Don't display ^M in buffers that have
;;; mixed line endings
;;; ------------
(defun remove-dos-eol ()
  "Do not show ^M in files containing mixed UNIX and DOS line endings."
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))

;;; ------------
;;; Programming major mode hooks
;;; ------------
; fontify some keywords: '@todo' 'FIXME' 'XXX'
(defun fontify-at-todo ()
  (font-lock-add-keywords nil
                          '(("@todo" 0 font-lock-warning-face prepend)
                            ("TODO" 0 font-lock-warning-face prepend)
                            ("FIXME" 0 font-lock-warning-face prepend)
                            ("XXX" 0 font-lock-warning-face prepend))))

;(font-lock-add-keywords 'c-mode
;    '(("\\<[\\+-]?[0-9]+\\(.[0-9]+\\)?\\>" 0 'font-lock-digit-face) ; FIXME: negative or positive prefixes do not highlight to this regexp but does to one below
;    ("\\([][{}()~^<>:=,.\\+*/%-]\\)" 0 'font-lock-digit-face)))

(font-lock-add-keywords 'c-mode
    '(("\\([][()~^<>:=,.\\+*/%-]\\)" 0 'font-lock-punctuation-face)))

(font-lock-add-keywords 'c-mode
    '(("\\<[\\+-]?[0-9]+\\(.[0-9A-Fa-f]+\\)?\\>" 0 'font-lock-digit-face)))


;; add special keyword hilighting
(add-hook 'emacs-lisp-mode-hook 'fontify-at-todo)
(add-hook 'ruby-mode-hook       'fontify-at-todo)
(add-hook 'c-mode-hook          'fontify-at-todo)
;(add-hook 'c-mode-hook          'fontify-punctuation)
;(add-hook 'c-mode-hook          'fontify-numbers)

;; doxymacs mode - assistance with doxygen comments
;(add-hook 'c-mode-hook          'doxymacs-mode)

;; cwarn mode - hilite suspicious c operations, .e.g. if(cond);
(add-hook 'c-mode-hook          'cwarn-mode)

;; add a hook to hilite current word to several programming modes
(add-hook 'emacs-lisp-mode-hook 'idle-highlight)
(add-hook 'ruby-mode-hook       'idle-highlight)
(add-hook 'c-mode-hook          'idle-highlight)

;; add a hook to show trailing whitespace in programming modes
;(add-hook 'emacs-lisp-mode-hook 'show-ws-toggle-show-trailing-whitespace)
;(add-hook 'ruby-mode-hook       'show-ws-toggle-show-trailing-whitespace)
;(add-hook 'c-mode-hook          'show-ws-toggle-show-trailing-whitespace)

;; add hook to navigate camelCase correctly.  wordBoundariesAtEmbeddedCapitalLetters
(add-hook 'c-mode-hook           'subword-mode)

;; add imenu to programming buffers
(add-hook 'emacs-lisp-mode-hook 'imenu-add-menubar-index)
(add-hook 'ruby-mode-hook       'imenu-add-menubar-index)
(add-hook 'c-mode-hook          'imenu-add-menubar-index)

;; auto-pair - automatically insert pairs of delimeters "" () {} [] etc
(add-hook 'c-mode-common-hook #'(lambda () (autopair-mode)))
(add-hook 'emacs-lisp-mode-hook #'(lambda () (autopair-mode)))
(add-hook 'ruby-mode-hook #'(lambda () (autopair-mode)))

;; rsense auto-completion for ruby
(add-hook 'ruby-mode-hook
          (lambda ()
            (add-to-list 'ac-sources 'ac-source-rsense-method)
            (add-to-list 'ac-sources 'ac-source-rsense-constant)))

;; ------------------
;; Shell / Terminal
;; ------------------
;; Add color to a shell running in emacs ‘M-x shell’
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; set maximum-buffer size for shell-mode
;;(setq comint-buffer-maximum-size 10240)
;; truncate shell buffer to comint-buffer-maximum-size
(add-hook 'comint-output-filter-functions
          'comint-truncate-buffer)

;; dont show passwords in clear text
(add-hook 'comint-output-filter-functions
          'comint-watch-for-password-prompt)

;; remove ctrl-m from shell output
(add-hook 'comint-output-filter-functions
          'comint-strip-ctrl-m)

(add-hook 'shell-mode-hook
          '(lambda ()
             (local-set-key [home]        ; move to beginning of line, after prompt
                            'comint-bol)
             (local-set-key [up]          ; cycle backward through command history
                            '(lambda () (interactive)
                               (if (comint-after-pmark-p)
                                   (comint-previous-input 1)
                                 (previous-line 1))))
             (local-set-key [down]        ; cycle forward through command history
                            '(lambda () (interactive)
                               (if (comint-after-pmark-p)
                                   (comint-next-input 1)
                                 (forward-line 1))))
             ))

;; ------------------
;; Org Mode!
;; ------------------
(require 'org-install)
(setq org-log-done t)

;; enable running snippets of code from org mode docs
;; see http://emacs-fu.blogspot.com/search/label/org-mode for more
;; org-babel-do-load-languages
;;  'org-babel-load-languages
;;   '( (perl . t)
;;      (ruby . t)
;;      (sh . t)
;;      (python . t)
;;      (emacs-lisp . t)
;;    ))

;; @todo: see if there is a way to reference file locations
;; from top of git repo
;;(add-to-list 'org-agenda-files "~/proj/stuff/org")


;; do not make backup files
;;(setq make-backup-files nil)
;; DO make backup files
(setq make-backup-files t)

;; return a backup file path of a give file path
;; with full directory mirroring from a root dir
;; non-existant dir will be created
(defun my-backup-file-name (fpath)
  "Return a new file path of a given file path.
   If the new path's directories does not exist, create them."
  (let (backup-root bpath)
    (setq backup-root "~/.emacs.d/emacs-backup")
    (setq bpath (concat backup-root fpath "~"))
    (make-directory (file-name-directory bpath) bpath)
    bpath
  )
)

(setq make-backup-file-name-function 'my-backup-file-name)


;; -----------------
;; Language and general indentation setup
;; -----------------
;; set tab width to 4 spaces
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;; hint for comments
(defadvice comment-or-uncomment-region (before slick-comment activate compile)
  "When called interactively with no active region, comment a single line instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (list (line-beginning-position)
           (line-beginning-position 2)))))

;; C mode
(setq c-basic-offset 4)
(setq c-default-style "linux"
      c-basic-offset 4)
(setq-default substatement-open 0)         ;; braces don't indent from if statements etc
(c-set-offset 'substatement-open 0)
(c-set-offset 'case-label '+)
(c-set-offset 'comment-intro 0)
;; treat underscore '_' as part of a word in c-mode
(modify-syntax-entry ?_ "w" c-mode-syntax-table)

;; C-mode keybindings
(defun my-c-mode-keybindings ()
  (define-key c-mode-map (kbd "C-c C-c") 'comment-or-uncomment-region))
(add-hook 'c-mode-common-hook 'my-c-mode-keybindings)

(add-hook 'c-mode-common-hook (lambda () (setq comment-start "// "
                                               comment-end   "")))

;; Ruby-mode keybindings
(defun my-ruby-mode-keybindings ()
  (define-key ruby-mode-map (kbd "C-c C-c") 'comment-or-uncomment-region)
  (define-key ruby-mode-map (kbd "C-c #")   'comment-or-uncomment-region)
  (define-key ruby-mode-map (kbd "C-c t")   'ruby-compilation-this-buffer)
  (define-key ruby-mode-map (kbd "C-c r")   'ruby-compilation-run)
  (define-key ruby-mode-map (kbd "C-c C-r") 'ruby-compilation-rake)
  (define-key ruby-mode-map (kbd "C-c .")   'rsense-complete))
(add-hook 'ruby-mode-hook 'my-ruby-mode-keybindings)

;; ----------------
;; Toggle Window Dedication
;; ----------------
(defun toggle-window-dedicated ()
  "Toggle whether the current active window is dedicated or not"
  (interactive)
  (message
   (if (let (window (get-buffer-window (current-buffer)))
         (set-window-dedicated-p window
                                 (not (window-dedicated-p window))))
     "Window '%s' is dedicated"
     "Window '%s' is normal")
   (current-buffer)))

;; -----------------
;; Get info on the last function run
;; -----------------
(defun describe-last-function()
  (interactive)
  (describe-function last-command))

;; -----------------
;; Hilite some text.  Search for same
;; -----------------
(defun search-selected-text()
  "Performs a nonincremental-search-forward. The text in the current region is what search for."
  (interactive)
  (let* (
         (start (min (point) (mark)))
         (end (max (point) (mark)))
         (word (buffer-substring start end))
         )
    (deactivate-mark)  ;; @todo - need to reselect mark for search result
    (search-forward word)))

;; -----------------
;; kill all dired buffers
;; -----------------
(defun kill-all-dired-buffers()
      "Kill all dired buffers."
      (interactive)
      (save-excursion
        (let((count 0))
          (dolist(buffer (buffer-list))
            (set-buffer buffer)
            (when (equal major-mode 'dired-mode)
              (setq count (1+ count))
              (kill-buffer buffer)))
          (message "Killed %i dired buffer(s)." count ))))

;; -----------------
;; Reload all open files.  I.e. revert a
;; all buffers visiting a file
;; -----------------
(defun revert-all-buffers ()
    "Refreshes all open buffers from their respective files."
    (interactive)
    (dolist (buf (buffer-list))
      (with-current-buffer buf
        (when (and (buffer-file-name) (not (buffer-modified-p)))
          (revert-buffer t t t) )))
    (message "Refreshed open files.") )

;; -----------------
;; Kill all buffers
;; good when doing lots of git'ing.  (Could also revert)
;; -----------------
(defun nuke-all-buffers ()
  "Kill all buffers, leaving *scratch* only."
  (interactive)
  (mapcar (lambda (x) (kill-buffer x)) (buffer-list)) (delete-other-windows))

;; ------------------
;; Show full path of buffer
;; Useful if editing different files
;; with same name
;; ------------------
(defun show-file-name ()
  "Show the full path file name in the minibuffer."
  (interactive)
  (message (buffer-file-name)))

;; -----------------
;; Insert Date stamp
;; -----------------
; ----------------- insertion macros --------------------
; insert current date/time
;   %m   month in [01..12]
;   %b   abbrev month name
;   %d   day in [01..31]
;   %y   year in [00..99]
;   %Y   full year
;   %H   hour in [00..23]
;   %M   minute in [00..59]
; see format-time-string for more info on formatting options
(defun my-time-string ()
  (format-time-string "%Y-%b-%d")) ; %H:%M
(defun insert-time-string ()
  "Insert time and date at cursor."
  (interactive)
  (insert (my-time-string)))



;; -----------------
;; Replace symbol at point.
;; from: http://scottmcpeak.com/elisp/scott.emacs.el
;; -----------------
(defun get-sym-at-cursor ()
  "Return the symbol name starting at the cursor"
  (save-excursion
    (re-search-forward "[_A-Za-z]\\([_A-Za-z0-9]\\)*")
    (match-string 0)
  ))

(defun replace-sym-at-cursor (replacement)
  "Replace symbol at cursor with argument, throughout buffer to end"
  (interactive "sReplacement: ")
  (save-excursion
    (let ((orig (get-sym-at-cursor)))
      (while (re-search-forward orig nil t)
        (replace-match replacement nil nil))
    )))


;; ----------------
;; Switch to, bury, or create
;; an ansi-term buffer depending
;; on state.
;; if current buffer is *bash*, bury
;; if *bash* exists but is not current, switch to
;; if *bash* doesn't exist, create and switch to
;; ----------------
(defun switch-to-or-create-shell ()
  "Bury, switch to or create ansi-term bash buffer"
  (interactive)
  (if (string= (buffer-name (current-buffer)) "*bash*")
      (bury-buffer)
      (if (get-buffer "*bash*")
           (switch-to-buffer "*bash*")
           (ansi-term "/bin/bash" "bash"))))

;; ----------------
;; Kill to start of line
;; Same as typing C-u 0 C-k
;; So i can make a binding
;; -----------------
(defun kill-start-of-line ()
  "kill from point to start of line"
  (interactive)
  (kill-line 0))

;; ------------------
;; backwards zap to char
;; ------------------
;; save a few keystrokes by passing a negative number to zap-to-char
(defun backwards-zap-to-char (arg char)
  (interactive "p\ncZap to char: ") (zap-to-char (- arg) char))

;; ------------------
;; bounce back and forth
;; btwn beginning of line
;; and beginning of code
;; ------------------
;; similar to function beginning-or-indentation from misc-cmds.el
(defun back-to-indentation-or-beginning () (interactive)
  (if (= (point) (progn (back-to-indentation) (point)))
      (beginning-of-line)))

;; -----------------
;; Aliases
;; -----------------
(defalias 'gf  'grep-find)
(defalias 'hlp 'highlight-parentheses-mode)
(defalias 'rab 'revert-all-buffers)
(defalias 'sws 'toggle-show-trailing-whitespace-show-ws)
(defalias 'vtt 'visit-tags-table)
(defalias 'gmw 'gdb-many-windows)
(defalias 'grw 'gdb-restore-windows)
(defalias 'bkr 'browse-kill-ring)
(defalias 'dbf 'diff-buffer-with-file)
(defalias 'dfb 'diff-buffer-with-file)

;; -----------------
;; Key Bindings
;; -----------------
(global-set-key [C-tab]         'other-window)
(global-set-key [C-delete]      'kill-word)
(global-set-key [C-backspace]   'backward-kill-word)
(global-set-key [home]          'beginning-of-line)
(global-set-key [end]           'end-of-line)
(global-set-key [C-home]        'beginning-of-buffer)
(global-set-key [C-end]         'end-of-buffer)
(global-set-key [C-f2]          'bm-toggle)
(global-set-key [f2]            'bm-next)
(global-set-key [S-f2]          'bm-previous)
(global-set-key [f3]            'search-selected-text)
(global-set-key [f4]            'switch-to-or-create-shell)
;; f5 is used by 'Anything'
(global-set-key [f6]            'revert-buffer-no-confirm)
(global-set-key [S-f6]          '(lambda () (interactive) (kill-buffer (current-buffer))))
(global-set-key [C-f6]          'revert-all-buffers)
(global-set-key [s-f6]          'nuke-all-buffers)     ;; Win-F6 - kill all buffers
(global-set-key [f7]            'next-error)
(global-set-key [S-f7]          'recompile)
(global-set-key [C-f7]          'kill-compilation)


; ace-jump-mode
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
; make a window stick with a buffer
(global-set-key [C-pause]       'toggle-window-dedicated)
; Describe last function - for when you want to know wtf emacs just did
(global-set-key (kbd "C-h z")   'describe-last-function)
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
                                        ; find-file-in-tags
(global-set-key (kbd "C-x ,")   'find-file-in-tags)
;(global-set-key (kbd "C-x C-b")  'electric-buffer-list)
; Make Emacs use "newline-and-indent" when you hit the Enter key so
; that you don't need to keep using TAB to align yourself when coding.
(global-set-key (kbd "C-m")     'newline-and-indent)
; fill paragraph - wrap lines to a column width including inside comments
(global-set-key (kbd "M-p")     'fill-paragraph)
;; toggle back and forth between speedbar
(global-set-key (kbd "C-c s")   'speedbar-get-focus)
;; get speedbar focus using Super Key
;;(global-set-key (kbd "s-s")     'speedbar-get-focus)
(global-set-key (kbd "s-s")     'sr-speedbar-toggle)
;; rgrep - friendly recursive grep function
(global-set-key (kbd "C-c g")   'rgrep)
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
;; insert a timestamp at point
(global-set-key (kbd "C-c t")   'insert-time-string)
;; eval region (I seem to use it a lot)
(global-set-key (kbd "C-c C-e") 'eval-region)
;; another binding for transpose lines (gnome steals C-M-t for launch terminal)
(global-set-key (kbd "C-S-t")   'transpose-lines)
;; buffer-move bindings
(global-set-key (kbd "<C-S-up>")     'buf-move-up)
(global-set-key (kbd "<C-S-down>")   'buf-move-down)
(global-set-key (kbd "<C-S-left>")   'buf-move-left)
(global-set-key (kbd "<C-S-right>")  'buf-move-right)
;; having to switch to M- (off of C-) for kill-ring-save seems to interrupt my flow alot
;; move seldomly-used quoted-insert and take its keybinding for kill-ring-save
(global-set-key (kbd "C-q")     'kill-ring-save)
(global-set-key (kbd "C-c q")   'quoted-insert)
;; iswitchb
; using this with autoindent mode now (global-set-key (kbd "<M-RET>") 'iswitchb-buffer)
;; hippie-expand
(global-set-key (kbd "M-/")     'hippie-expand)
;; backwards zap to char
(global-set-key (kbd "C-M-z")   'backwards-zap-to-char)
;; see list of killed text
(global-set-key (kbd "C-c k")   'browse-kill-ring)
;; lusty
(global-set-key (kbd "C-c C-f") 'lusty-file-explorer)
(global-set-key (kbd "C-c C-b") 'lusty-buffer-explorer)
;; temp - buff-menu is being interfered with by some other package - use ibuffer for now
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-c b")   'bury-buffer)
;; insert '%' unless cursor just moved AND next to a paren/brace/bracket
(global-set-key (kbd "%")       'goto-match-paren)
;; iflipb bindings
(global-set-key (kbd "<C-tab>") 'iflipb-next-buffer)
(global-set-key
 (if (featurep 'xemacs) (kbd "<C-iso-left-tab>") (kbd "<C-S-iso-lefttab>"))
  'iflipb-previous-buffer)

;; add occur mode to isearch-forward:
;; switch to occur from a search, e.g.
;; C-s foo C-o
(define-key isearch-mode-map (kbd "C-o")
  (lambda ()
    (interactive)
    (let ((case-fold-search isearch-case-fold-search))
      (occur (if isearch-regexp isearch-string
               (regexp-quote isearch-string))))))

;; A safer exit keybind.
(global-set-key (kbd "C-x C-c")
  (lambda ()
   (interactive)
   (if (y-or-n-p-with-timeout "Do you really want to exit Emacs? " 4 nil)
       (save-buffers-kill-emacs))))

;; @todo WIP not working -
;;       <menu> is bound to M-x by default, but clearing the menu key
;;       bindings makes the shortcut not work
;; unset the menu key (aka Hyper)
;(global-unset-key (kbd "<menu>"))
;; get speedbar focus using Hyper Key (aka right-menu)
;(global-set-key (kbd "H-s")   'speedbar-get-focus)


;; -----------------
;; Major Modes for filename patterns
;; -----------------
(setq auto-mode-alist
      (append '(("\\.[Cc][Xx][Xx]$" . c++-mode)
                ("\\.[Cc][Pp][Pp]$" . c++-mode)
                ("\\.[Hh][Xx][Xx]$" . c++-mode)
                ("\\.[Tt][Cc][Cc]$" . c++-mode)
                ("\\.i$"            . c++-mode)    ; SWIG
                ("\\.h$"            . c-mode)
                ("\\.mm?$"          . objc-mode)
                ("_emacs"           . lisp-mode)
                ("\\.el\\.gz$"      . lisp-mode)
                ("\\.mak$"          . makefile-mode)
                ("Doxyfile.tmpl$"   . makefile-mode)
                ("Doxyfile$"        . makefile-mode)
                ("\\.conf$"         . conf-mode)
                ("\\.uncompressed$" . hexl-mode)
                ("\\.bin$"          . hexl-mode)
                ("\\.ota$"          . hexl-mode)
                ("\\.rb$"           . ruby-mode)
                ("Rakefile$"        . ruby-mode)
                ("\\.rake$"         . ruby-mode)
                ("\\.feature$"      . feature-mode)
                ("\\.yml$"          . yaml-mode)
                ("\\.lua$"          . lua-mode)
                ("\\.org$"          . org-mode)
                ("\\.xml$"          . html-mode)
                ("\\.scons$"        . python-mode)
                ("SCons\\(cript\\|truct\\)" . python-mode)
                ("\\.gclient$"      . python-mode)
                ("COMMIT_EDITMSG$"  . git-commit-mode)
                ("\\.ahk$"          . ahk-mode)
                ("\\.proto$"        . protobuf-mode)
                ("\\.clj$"          . clojure-mode)
                ("\\.gdb$"          . gdb-script-mode)
                ) auto-mode-alist))
