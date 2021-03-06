;; misc-utils.el
;; Various handy functions found in travels across the intarbwebz

; ======================================================================
; https://stackoverflow.com/questions/26677909/emacs-sql-mode-postgresql-and-inputing-password
(defun my-pass (key)
  (string-trim-right
   (shell-command-to-string (concat "pass " key))))

; ======================================================================
; https://emacs.stackexchange.com/questions/37887/send-region-to-shell-in-another-buffer/37889
(defun tws-region-to-process (arg beg end)
  "Send the current region to a process buffer.
The first time it's called, will prompt for the buffer to
send to. Subsequent calls send to the same buffer, unless a
prefix argument is used (C-u), or the buffer no longer has an
active process."
  (interactive "P\nr")
  (when (or arg ;; user asks for selection
          (not (boundp 'tws-process-target)) ;; target not set
          ;; or target is not set to an active process:
          (not (process-live-p (get-buffer-process tws-process-target))))
    (let (procs buf)
     (setq procs (remove nil (seq-map
                  (lambda (el)
                    (when (setq buf (process-buffer el))
                      (buffer-name buf)))
                  (process-list))))
     (if (not procs) (error "No process buffers currently open.")
      (setq tws-process-target (completing-read "Process: " procs)))))
  (process-send-region tws-process-target beg end))

; ======================================================================
;; from http://www.emacswiki.org/emacs/DuplicateLines
(defun uniquify-all-lines-region (start end)
  "Find duplicate lines in region START to END keeping first occurrence."
  (interactive "*r")
  (save-excursion
    (let ((end (copy-marker end)))
      (while
          (progn
            (goto-char start)
            (re-search-forward "^\\(.*\\)\n\\(\\(.*\n\\)*\\)\\1\n" end t))
        (replace-match "\\1\n\\2")))))

(defun uniquify-all-lines-buffer ()
  "Delete duplicate lines in buffer and keep first occurrence."
  (interactive "*")
  (uniquify-all-lines-region (point-min) (point-max)))

; ======================================================================
;; From http://stackoverflow.com/questions/206806/filtering-text-through-a-shell-command-in-emacs
(defun generalized-shell-command (command arg)
  "Unifies `shell-command' and `shell-command-on-region'. If no
region is selected, run a shell command just like M-x
shell-command (M-!).  If no region is selected and an argument is
a passed, run a shell command and place its output after the mark
as in C-u M-x `shell-command' (C-u M-!).  If a region is selected
pass the text of that region to the shell and replace the text in
that region with the output of the shell command as in C-u M-x
`shell-command-on-region' (C-u M-|). If a region is selected AND
an argument is passed (via C-u) send output to another buffer
instead of replacing the text in region."
  (interactive (list (read-from-minibuffer "Shell command: " nil nil nil 'shell-command-history)
                     current-prefix-arg))
  (let ((p (if mark-active (region-beginning) 0))
        (m (if mark-active (region-end) 0)))
    (if (= p m)
        ;; No active region
        (if (eq arg nil)
            (shell-command command)
          (shell-command command t))
      ;; Active region
      (if (eq arg nil)
          (shell-command-on-region p m command t t)
        (shell-command-on-region p m command)))))

; ======================================================================
;; indent whole buffer
(defun iwb ()
  ;; from http://emacsblog.org/2007/01/17/indent-whole-buffer/
  "indent whole buffer"
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil)
  (untabify (point-min) (point-max)))

(defun sudo-find-file (file-name)
  "Like find file, but opens the file as root."
  (interactive "FSudo Find File: ")
  (let ((tramp-file-name (concat "/sudo::" (expand-file-name file-name))))
    (find-file tramp-file-name)))

; ======================================================================
(defun djcb-find-file-as-root ()
  "Like `ido-find-file, but automatically edit the file with
root-privileges (using tramp/sudo), if the file is not writable by
user."
  (interactive)
  (let ((file (ido-read-file-name "Edit as root: ")))
    (unless (file-writable-p file)
      (setq file (concat "/sudo:root@localhost:" file)))
    (find-file file)))

(global-set-key (kbd "C-x F") 'djcb-find-file-as-root)

; ======================================================================
;; from https://gist.github.com/mads379/3402786
(defun toggle-maximize-buffer () "Maximize buffer"
  (interactive)
  (if (= 1 (length (window-list)))
      (jump-to-register '_)
    (progn
      (window-configuration-to-register '_)
      (delete-other-windows))))

(global-set-key (kbd "C-x C-1") 'toggle-maximize-buffer)

; ======================================================================
; Cycle forward thru kill-ring with the addition of shift
(defun yank-pop-forwards (arg)
  (interactive "p")
  (yank-pop (- arg)))

(global-set-key (kbd "M-Y") 'yank-pop-forwards) ; M-Y (Meta-Shift-Y)

; ======================================================================
;; lifted from emacs.wordpress.com
(defun jao-copy-line (arg)
  "Copy line(s) to the kill ring"
  (interactive "p")
  (kill-ring-save (line-beginning-position)
                  (line-beginning-position (+ 1 arg)))
  (message "%d line%s copied" arg (if (= 1 arg) "" "s")))

; ======================================================================
; Previous window (move in opposite direction than C-x o)
(defun select-previous-window ()
    "Switch to the previous window"
      (interactive)
        (select-window (previous-window)))
(global-set-key (kbd "C-x p") 'select-previous-window)

; ======================================================================
; Move current line (text) up or down (from whattheemacsd!)
; tweaked move-line-up - wasn't working for me with save-excursion
; these are swell bound to e.g. s-up and s-down
(defun move-line-down ()
  (interactive)
  (let ((col (current-column)))
    (save-excursion
      (forward-line)
      (transpose-lines 1))
    (forward-line)
    (move-to-column col)))

(defun move-line-up ()
  (interactive)
  (let ((col (current-column)))
  (transpose-lines 1)
  (forward-line -2)
  (move-to-column col)))

; move current line up and down in buffer
(global-set-key (kbd "<s-down>") 'move-line-down)
(global-set-key (kbd "<s-up>")   'move-line-up)

; ======================================================================
; Change file name (and buffer name) of current buffer, presenting the
; current name for editing. (from whattheemacsd!)
(defun rename-current-buffer-file ()
  "Renames current buffer and file it is visiting."
  (interactive)
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
        (error "Buffer '%s' is not visiting a file!" name)
      (let ((new-name (read-file-name "New name: " filename)))
        (if (get-buffer new-name)
            (error "A buffer named '%s' already exists!" new-name)
          (rename-file filename new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil)
          (message "File '%s' successfully renamed to '%s'"
                   name (file-name-nondirectory new-name)))))))

(global-set-key (kbd "C-x C-r") 'rename-current-buffer-file)

; ====================================================================
; Toggle a two-window frame between side-by-side and over-under view (whattheemacsd!)
(defun toggle-window-split ()
  (interactive)
  (if (= (count-windows) 2)
      (let* ((this-win-buffer (window-buffer))
             (next-win-buffer (window-buffer (next-window)))
             (this-win-edges (window-edges (selected-window)))
             (next-win-edges (window-edges (next-window)))
             (this-win-2nd (not (and (<= (car this-win-edges)
                                         (car next-win-edges))
                                     (<= (cadr this-win-edges)
                                         (cadr next-win-edges)))))
             (splitter
              (if (= (car this-win-edges)
                     (car (window-edges (next-window))))
                  'split-window-horizontally
                'split-window-vertically)))
        (delete-other-windows)
        (let ((first-win (selected-window)))
          (funcall splitter)
          (if this-win-2nd (other-window 1))
          (set-window-buffer (selected-window) this-win-buffer)
          (set-window-buffer (next-window) next-win-buffer)
          (select-window first-win)
          (if this-win-2nd (other-window 1))))))

; ====================================================================
; https://www.reddit.com/r/emacs/comments/30b67j/how_can_you_reset_emacs_to_the_default_theme/
(defun switch-theme (theme)
  ;; This interactive call is taken from `load-theme'
  (interactive
   (list
    (intern (completing-read "Load custom theme: "
                             (mapcar 'symbol-name
                                     (custom-available-themes))))))
  (mapcar #'disable-theme custom-enabled-themes)
  (load-theme theme t)
)

; =====================================================================
; list all non-interactive functions
; http://stackoverflow.com/questions/605785/how-do-i-get-a-list-of-emacs-lisp-non-interactive-functions
;;;;;;;;;;;;; XXXXXXXX NOT WORKING IN 2017.01.08
;(defun list-functions
;    (flet ((first-line (text)
;                       (if text
;                           (substring text 0 (string-match "\n" text))
;                         "")))
;      (mapatoms
;       (lambda (x)
;         (and (fboundp x)                          ; does x name a function?
;              (not (commandp (symbol-function x))) ; is it non-interactive?
;              (subrp (symbol-function x))          ; is it built-in?
;              (insert (symbol-name x) " - " (first-line (documentation x)) "\n"))))))

; ========================================================================
; pretty-print XML, including adding line breaks
; http://stackoverflow.com/questions/12492/pretty-printing-xml-files-on-emacs
(defun bf-pretty-print-xml-region (begin end)
  "Pretty format XML markup in region. You need to have nxml-mode
http://www.emacswiki.org/cgi-bin/wiki/NxmlMode installed to do
this.  The function inserts linebreaks to separate tags that have
nothing but whitespace between them.  It then indents the markup
by using nxml's indentation rules."
  (interactive "r")
  (save-excursion
    (nxml-mode)
    (goto-char begin)
    (while (search-forward-regexp "\>[ \\t]*\<" nil t)
      (backward-char) (insert "\n"))
    (indent-region begin end))
  (message "Ah, much better!"))

; ========================================================================
; http://ergoemacs.org/emacs/modernization_isearch.html
; Search next thing at point, like '*' in vim
(defun xah-search-current-word ()
  "Call `isearch' on current word or text selection.
“word” here is A to Z, a to z, and hyphen 「-」 and underline 「_」, independent of syntax table.
URL `http://ergoemacs.org/emacs/modernization_isearch.html'
Version 2015-04-09"
  (interactive)
  (let ( -p1 -p2 )
    (if (use-region-p)
        (progn
          (setq -p1 (region-beginning))
          (setq -p2 (region-end)))
      (save-excursion
        (skip-chars-backward "-_A-Za-z0-9")
        (setq -p1 (point))
        (right-char)
        (skip-chars-forward "-_A-Za-z0-9")
        (setq -p2 (point))))
    (setq mark-active nil)
    (when (< -p1 (point))
      (goto-char -p1))
    (isearch-mode t)
    (isearch-yank-string (buffer-substring-no-properties -p1 -p2))))

; ========================================================================
;;; Stefan Monnier <foo at acm.org>. It is the opposite of fill-paragraph
(defun unfill-paragraph (&optional region)
  "Takes a multi-line paragraph and makes it into a single line of text."
  (interactive (progn (barf-if-buffer-read-only) '(t)))
  (let ((fill-column (point-max))
        ;; This would override `fill-column' if it's an integer.
        (emacs-lisp-docstring-fill-column t))
    (fill-paragraph nil region)))

; ========================================================================
(defun revert-buffer-no-confirm ()
  "Revert buffer without confirmation."
  (interactive) (revert-buffer t t))
