;; NOTES
;;-To byte-compile all elisp files in current directory and below:
;;   C-u 0 M-x byte-recompile-directory
;;   (The C-u 0 makes it not ask for every file)
;;-(diff-buffer-with-file)
;;-smerge to eat diff3 output

;; get directory of this file and append .emacs.d to set up various paths

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(defconst my-config-dir (file-name-directory load-file-name))
(message (concat "This is what I'll use as top-level config dir: " my-config-dir))

;; save emacs (customize-xxxx) changes their own file
(setq custom-file (concat my-config-dir "custom.el"))
(load custom-file 'noerror)

;; Use pallet and cask to manage ELPA elisp packages
;; To set up cask:
;; 1.) git clone https://github.com/cask/cask ~/.cask
;; 2.) ln -s ~/.cask/bin/cask ~/bin # or otherwise add cask to the path
;; 3.) cd ~/.emacs.d && cask install
(require 'cask "~/.cask/cask.el")
(setq cask-file "~/.emacs.d/Cask")
(cask-initialize)

(require 'pallet)
(pallet-mode t)

(require 'use-package)

(server-start)

;; look under .emacs.d for packages
(let ((default-directory my-config-dir))
  (normal-top-level-add-subdirs-to-load-path))

(require 'cl)
(defun load-files-matching-pattern (init-dir init-file-regex)
  "Load all files in <dir> matching <file-regex>
   e.g.
   (load-files-matching-regex '/path/to/elisp/files' '.*el$') "
  (loop for init-file in
        (directory-files init-dir nil init-file-regex)
        do (progn
             (load init-file)
             (message (concat "Loaded this file: " init-file)))))

;; load all files in init.d.
;; files in init.d are sorted before loading
;; files in init.d beginning with and underscore are ignored
(defconst my-el-initd (concat my-config-dir "init.d"))
(setq my-el-init-file-regex "^[^_].*.el$")
(load-files-matching-pattern my-el-initd my-el-init-file-regex)

;; set up default location for emacs-themes
(setq custom-theme-directory (concat my-config-dir "themes"))

;; TODO - move this mac stuff to mac specific setup file
(if (eq system-type 'darwin)
    (progn
      (setq ns-function-modifier 'hyper)
      (setq mac-command-modifier 'super)
      (setq mac-option-modifier  'meta)
      (toggle-menu-bar-mode-from-frame)))

(if (eq window-system 'ns)
    ;;something for OS X if true
    ; workaround for having trouble with colors on OSX
    (setq x-colors (ns-list-colors))

   ;; optional something if not
)

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

;; functions and settings for working with tags
;; (specific to projects I'm working on)
(load-library "tag-utils.el")

;; Set up color themes for console vs X
;(add-hook 'after-make-frame-functions
;  '(lambda (f)
;  (with-selected-frame f

;; ido - interactively do stuff - great flex matching for possible completions in input
(setq ido-enable-flex-matching t)
(ido-mode t)
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

;; textmate mode - lots of the joys of textmate with less textmate
;(require 'textmate)
;(textmate-mode)

;; a little work around for icicles - kill-buffer gets mapped to
;; icicle-kill-buffer.  BUT that calls (in some cases)
;; kill-buffer-and-its-windows, which I fucking hate
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

;; autocomplete - learning, completion-showing extension
;(require 'auto-complete-config)
;(require 'auto-complete-etags)
(setq ac-stop-words '("/" "//"))  ; don't autocomplete C comments

;(add-to-list 'ac-dictionary-directories (concat my-config-dir "elpa/auto-complete-1.4.20110207/dict"))
;(ac-config-default)

;; Browse kill ring - see list of text that has been killed
(require 'browse-kill-ring)

;; Highlight the parens cursor is within
;(require 'highlight-parentheses)
;(highlight-parentheses-mode 'nil)

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
(setq auto-indent-backward-delete-char-behavior (quote hungry))
(setq auto-indent-blank-lines-on-move nil)
;(require 'auto-indent-mode)

;; bookmarks - visible and possibly persistent bookmarks
(require 'bm)

;; etags-select - look thru list of matching tags before jumping
(require 'etags-select)
; keybindings below

;; find file in tags - run (find-file-in-tags), enter filename
;; that exists in tags file, and voila - visited.
(require 'find-file-in-tags)
; keybindings below

;; wgrep - edit grep results right in the grep buffer and save changes to files
(require 'wgrep)

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

;; abbrev-mode - use it to correct common typos (e.g. flase -> false)
(setq-default abbrev-mode t)
(setq abbrev-file-name "~/.emacs.d/abbrev_defs")
(setq save-abbrevs t)

;; add some more package repositories for ELPA - DM
(require 'package)

(setq package-archives
      '(("marmalade" . "https://marmalade-repo.org/packages/")
        ("org"       . "http://orgmode.org/elpa/")
        ("ELPA"      . "https://elpa.gnu.org/packages/")
        ("melpa"     . "https://melpa.org/packages/")))

;;------------------
;; General Behavior
;;------------------
;; start emacs server so you can open files in this session from other shells
;; *unless* it's already running
;; (load "server")
;; (unless (server-running-p)
;;     (server-start)
;;     ;; When opening a buffer from emacsclient, don't prompt when it is killed
;;     (remove-hook 'kill-buffer-query-functions 'server-kill-buffer-query-function))

;; Enable recursive minibuffer
(setq enable-recursive-minibuffers t)
;; Kill minibuffer when mouse clicks somewhere else
(defun stop-using-minibuffer ()
  "kill the minibuffer"
  (when (and (>= (recursion-depth) 1) (active-minibuffer-window))
    (abort-recursive-edit)))

(add-hook 'mouse-leave-buffer-hook 'stop-using-minibuffer)

;; Remove trailing whitespace when a file is saved
(add-hook 'before-save-hook 'delete-trailing-whitespace)

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

;; session saving
(require 'desktop)
(desktop-save-mode 1)
(defun my-desktop-save ()
  (interactive)
  ;; Don't call desktop-save-in-desktop-dir, as it prints a message.
  (if (eq (desktop-owner) (emacs-pid))
      (desktop-save desktop-dirname)))
(add-hook 'auto-save-hook 'my-desktop-save)

;; -----------------
;; TRAMP setup
;; -----------------
;; (require 'tramp)
;; (setq tramp-debug-buffer t)
;; (setq tramp-verbose 9)
;; (setq tramp-default-method "ssh")
;; (setq tramp-password-prompt-regexp ".*[Pp]assword: *$")
;; (setq shell-prompt-pattern "^[^#$%>\n]*[#$%>] *")
;; ;(setq tramp-shell-prompt-pattern "^[^;$#>]*[;$#>] *")
;; (setq tramp-shell-prompt-pattern "^.*$.*")
;; (setq password-cache-expiry nil)
(set-default 'tramp-default-proxies-alist (quote ((".*" "\\`root\\'" "/ssh:%h:"))))
;; note: this works now:
; /ssh:bird@bastion|ssh:you@remotehost:/path
; /ssh:you@remotehost|sudo:them@remotehost:/path/to/file
; C-x C-f /ssh:you@remotehost|sudo:remotehost:/path/to/file RET

;; -----------------
;; Look and Feel
;; -----------------
;; Set font.  To see what's at cursor, C-u C-x =
;(defvar myFont "-unknown-DejaVu Sans Mono-normal-normal-normal-*-12-*-*-*-*-0-iso10646-1")
;(defvar myFont "-unknown-DejaVu Sans Mono-normal-normal-normal-*-13-*-*-*-*-0-iso10646-1")
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
;; (defface hl-line '((t (:background "#1A1A1A")))
;;   "Face to use for `hl-line-face'." :group 'hl-line)
;; (setq hl-line-face 'hl-line)
;; (global-hl-line-mode nil)

;; If region is active and text is inserted, kill region
(delete-selection-mode +1)

;; display date and time always
(setq display-time-day-and-date t)
(display-time)

;; Show column number in status bar
(setq column-number-mode t)

;; show line numbers in fringe
;; (global-linum-mode t)
(add-hook 'find-file-hook (lambda () (linum-mode 1)))
(add-hook 'find-file-hook (lambda () (hlinum-activate)))
(setq linum-format "%d|")

;; show current function name in mode-line
(add-hook 'find-file-hook (lambda () (which-function-mode 1)))

;; show a visual indicator of view's position of buffer in the modeline
;(sml-modeline-mode)

;; C-k kills whole line and newline if at beginning of line
(setq kill-whole-line t)

;; Always add a final newline
(setq require-trailing-newline t)

;; enable the upcase-region and downcase-region commands
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;; No scrollbar
(if (fboundp 'scroll-bar-mode)
    (scroll-bar-mode -1)               ;; graphical emacs, no scroll-bar
    (toggle-menu-bar-mode-from-frame)) ;; probably text emacs, turn off menu-bar

;; Show indicators of buffer boundaries in fringe
;(setq-default indicate-buffer-boundaries 'left
;      default-indicate-empty-lines t)

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
;; switch back and forth with e.g. 'M-x toggle <RET> truncate-lines'
(setq-default truncate-lines nil)

;; disable annoying emacs splash screen
(setq inhibit-splash-screen t)

;; Changes all yes/no questions to y/n type
(fset 'yes-or-no-p 'y-or-n-p)

;; ask for conf when opening mega-large files
(setq large-file-warning-threshold 200000000)

;; Scroll down with the cursor,move down the buffer one
;; line at a time, instead of in larger amounts.
(setq scroll-step 1)
;; actually like this better
(setq scroll-step 10)

;; default size and location
(add-to-list 'default-frame-alist '(left . 0))
(add-to-list 'default-frame-alist '(top . 0))

;; titlebar = buffer unless filename
(setq frame-title-format '(buffer-file-name "emacs - %f" ("emacs - %b")))

;; Drive out the mouse when it's too near to the cursor.
;(mouse-avoidance-mode 'animate)

;; cursor is a line instead of block
(setq-default cursor-type  '(bar . 3))
(setq-default cursor-color "#ffffff")

;; change cursor color at each blink
(defvar blink-cursor-colors (list  "#92c48f" "#6785c5" "#be369c" "#d9ca65")
  "On each blink the cursor will cycle to the next color in this list.")

;; (setq blink-cursor-count 0)
;; (defun blink-cursor-timer-function ()
;;   "Zarza wrote this cyberpunk variant of timer `blink-cursor-timer'.
;; Warning: overwrites original version in `frame.el'.

;; This one changes the cursor color on each blink. Define colors in `blink-cursor-colors'."
;;   (when (not (internal-show-cursor-p))
;;     (when (>= blink-cursor-count (length blink-cursor-colors))
;;       (setq blink-cursor-count 0))
;;     (set-cursor-color (nth blink-cursor-count blink-cursor-colors))
;;     (setq blink-cursor-count (+ 1 blink-cursor-count))
;;     )
;;   (internal-show-cursor nil (not (internal-show-cursor-p))))


;; make split-window-vertically put next buffer in new window
(defadvice split-window-vertically
  (after my-window-splitting-advice first () activate)
  (set-window-buffer (next-window) (other-buffer)))
(defadvice split-window-right
  (after my-window-splitting-advice first () activate)
  (set-window-buffer (next-window) (other-buffer)))
(defadvice split-window-below
  (after my-window-splitting-advice first () activate)
  (set-window-buffer (next-window) (other-buffer)))

;; cua mode (rectangle only)
(setq cua-enable-cua-keys nil)
(cua-mode)

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
    (setq backup-root (concat my-config-dir "emacs-backup"))
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


;; -----------------
;; Aliases
;; -----------------
(defalias 'gf   'grep-find)
(defalias 'rb   'rename-buffer)
(defalias 'hlp  'highlight-parentheses-mode)
(defalias 'rab  'revert-all-buffers)
(defalias 'sws  'toggle-show-trailing-whitespace-show-ws)
(defalias 'vtt  'visit-tags-table)
(defalias 'gmw  'gdb-many-windows)
(defalias 'grw  'gdb-restore-windows)
(defalias 'bkr  'browse-kill-ring)
(defalias 'dbf  'diff-buffer-with-file)
(defalias 'dfb  'diff-buffer-with-file)
(defalias 'ar   'align-regexp)
(defalias 'cr   'comment-or-uncomment-region)
(defalias 'wd   'wdired-change-to-wdired-mode)
(defalias 'reb  're-builder)
(defalias 'tde  'toggle-debug-on-error)
(defalias 'lm   'linum-mode)
(defalias 'tail 'auto-revert-tail-mode)

;; -----------------
;; Predefined Registers
;; -----------------
(set-register ?e '(file . "~/.emacs.d/init.el"))
(set-register ?o '(file . "~/misc.org"))
(set-register ?r '(file . "/tmp/temp.rb"))
(set-register ?l '(file . "~/.emacs.d/.cask/24.3.50.1/elpa"))
(set-register ?s '(file . "~/.emacs.d/snippets"))

(require 'epa-file)
(setq epa-file-cache-passphrase-for-symmetric-encryption t)


;; When trying to kill a dirty buffer, prompt
;; to save, diff, or kill
;; from http://stackoverflow.com/questions/331569/diff-save-or-kill-when-killing-buffers-in-emacs/334600#334600
(defadvice kill-buffer (around my-kill-buffer-check disable) ;; change disable->activate once this is modified to only work on file-buffers
  "Prompt when a buffer is about to be killed."
  (let* ((buffer-file-name (buffer-file-name))
         backup-file)
    ;; see 'backup-buffer
    (if (and (buffer-modified-p)
             buffer-file-name
             (file-exists-p buffer-file-name)
             (setq backup-file (car (find-backup-file-name buffer-file-name))))
        (let ((answer (completing-read (format "Buffer modified %s, (d)iff, (s)ave, (k)ill? " (buffer-name))
                                       '("d" "s" "k") nil t)))
          (cond ((equal answer "d")
                 (set-buffer-modified-p nil)
                 (let ((orig-buffer (current-buffer))
                       (file-to-diff (if (file-newer-than-file-p buffer-file-name backup-file)
                                         buffer-file-name
                                       backup-file)))
                   (set-buffer (get-buffer-create (format "%s last-revision" (file-name-nondirectory file-to-diff))))
                   (buffer-disable-undo)
                   (insert-file-contents file-to-diff nil nil nil t)
                   (set-buffer-modified-p nil)
                   (setq buffer-read-only t)
                   (ediff-buffers (current-buffer) orig-buffer)))
                ((equal answer "k")
                 (set-buffer-modified-p nil)
                 ad-do-it)
                (t
                 (save-buffer)
                 ad-do-it)))
      ad-do-it)))

;; -----------------
;; Major Modes for filename patterns
;; -----------------
(setq auto-mode-alist
      (append '(("\\.mm?$"          . objc-mode)
                ("\\.conf$"         . conf-mode)
                ("\\.uncompressed$" . hexl-mode)
                ("\\.bin$"          . hexl-mode)
                ("\\.ota$"          . hexl-mode)
                ("\\.xml$"          . html-mode)
                ("\\.scons$"        . python-mode)
                ("SCons\\(cript\\|truct\\)" . python-mode)
                ("\\.gclient$"      . python-mode)
                ("\\.gdb$"          . gdb-script-mode)
                ("\\.md$"           . markdown-mode)
                ("diary"            . diary-mode)
                ) auto-mode-alist))

;;------------------
;; Load a config sub-file from my config dir.
;; Adapted from http://stackoverflow.com/questions/2079095/how-to-modularize-an-emacs-configuration
;;------------------
(defun load-user-file (file)
  (interactive "f")
  "Load a file in current user's configuration directory"
  (load-file (expand-file-name file my-config-dir)))

(load-user-file "faces-setup.el")
(load-user-file "programming-setup.el")
(load-user-file "ruby-setup.el")
(load-user-file "c-setup.el")
(load-user-file "elisp-setup.el")
(load-user-file "yaml-setup.el")
(load-user-file "javascript-setup.el")
(load-user-file "erlang-setup.el")
(load-user-file "elixir-setup.el")
(load-user-file "go-setup.el")
(load-user-file "rust-setup.el")
(load-user-file "clojure-setup.el")
(load-user-file "git-setup.el")
(load-user-file "css-setup.el")
(load-user-file "coffee-setup.el")
(load-user-file "lua-setup.el")
(load-user-file "java-setup.el")
(load-user-file "ediff-setup.el")
(load-user-file "dired-setup.el")
(load-user-file "irc-setup.el")
(load-user-file "sh-setup.el")
(load-user-file "misc-utils.el")
(load-user-file "my-misc-utils.el")
(load-user-file "my-misc-advice.el")

(message "All set.")
(put 'erase-buffer 'disabled nil)
