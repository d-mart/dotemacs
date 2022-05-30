(defun dm/select-current-line ()
  "Set the region to the entire current line"
  (interactive)
  (transient-mark-mode)
  (end-of-line)
  (set-mark (line-beginning-position)))

(defun dm/select-another-line ()
  "Move the mark to the end of the next line"
  (interactive)
  (if (region-active-p)
      (progn
        (forward-line 1)
         (end-of-line))
    (dm/select-current-line)))

(defun dm/select-current-word ()
  "Set the region to the current word"
  (interactive)
  (transient-mark-mode)
  (let (pt)
    (skip-chars-backward "-_A-Za-z0-9")
    (setq pt (point))
    (skip-chars-forward "-_A-Za-z0-9")
    (set-mark pt)))

(defun dm/kill-ring-save-region-or-line ()
  "If the region is active, save it to the kill ring. Otherwise save current line to kill ring"
  (interactive)
  (save-excursion
    (unless (region-active-p) (dm/select-current-line))
    (kill-ring-save (region-beginning) (region-end))))

(defun dm/join-line-end-of-line ()
  "Go to end of line, join line, go to end of line"
  ;; TODO make this repeat over a region
  (interactive)
  (next-line)
  (end-of-line)
  (join-line)
  (just-one-space 0)
  (end-of-line))

(defun dm/join-lines-with-comma (beginning end)
  "join all lines in region into one line separated by commas"
  (interactive "r")
  (if (use-region-p)
      (progn
        (goto-char beginning)
        (while (re-search-forward "\n" end t)
          (replace-match "," nil nil))
        (goto-char beginning))
    (message "(region is not active)")))

(defun dm/split-on-str (split-str)
  "Split lines on a given string. The string is removed"
  (interactive "sSplit lines on: ")
    (goto-char (line-beginning-position))
    (while (re-search-forward split-str (line-end-position) t)
      (replace-match "\n" nil nil)))

(defun set-tab-width ()
  "Set tab width locally. Accept universal arg or prompt"
  (interactive)
  (setq tab-width (string-to-int (read-from-minibuffer "Tab width: " )))
  (message "Set tab width to %d" tab-width))
(defalias 'set-tab-width 'tw)

;;; ------------
;;; Don't display ^M in buffers that have
;;; mixed line endings
;;; ------------
(defun remove-dos-eol ()
  "Do not show ^M in files containing mixed UNIX and DOS line endings."
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))

;; -----------------
;; Get info on the last function run
;; -----------------
(defun describe-last-function()
  (interactive)
  (describe-function last-command))

;; -----------------
;; Mark some text. Search for same
;; -----------------
(defun search-selected-text()
  "Performs a nonincremental-search-forward. The text in the current region is what search for."
  (interactive)
  (let* (
         (start (min (point) (mark)))
         (end (max (point) (mark)))
         (word (buffer-substring start end))
         )
    (deactivate-mark)  ;; todo - need to reselect mark for search result
    (search-forward word)))

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
;; -----------------
(defun nuke-all-buffers ()
  "Kill all buffers, leaving *scratch* only."
  (interactive)
  (mapcar (lambda (x) (kill-buffer x)) (buffer-list)) ; kill all buffers
  (delete-other-windows)  ; kill all other windows
  (switch-to-buffer "*scratch*")) ; create new *scratch* buffer

(defun nuke-all-clean-buffers ()
  "Kill all clean/saved buffers"
  (interactive)
  (mapcar
   (lambda (x)
     (if (not (buffer-modified-p x))
         (kill-buffer x)))
   (buffer-list)) ; kill all buffers
  (delete-other-windows)  ; kill all other windows
  (switch-to-buffer "*scratch*"))

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
(defun backward-zap-to-char (arg char)
  (interactive "p\ncZap to char: ") (zap-to-char (- arg) char))

;; ------------------
;; bounce back and forth
;; btwn beginning of line
;; and beginning of code
;; ------------------
;; similar to function beginning-or-indentation from misc-cmds.el
(defun back-to-indentation-or-beginning (&optional arg) (interactive "P")
  ;(if (= 'arg 'arg) (progn (message "universal arg") (message "NOT universal arg")))
  (if (= (point) (progn (back-to-indentation) (point)))
      (beginning-of-line)))

;; ------------------
;; ANSI-colorize a file (e.g. Rails logs)
;; ------------------
(defun ansi-colorize ()
  (interactive)
  (save-excursion
    (require 'ansi-color)
    (ansi-color-apply-on-region (point-min) (point-max))))

;; ------------------
;; increment the last integer on a line
;; ------------------
(defun inc-integer (p m)
  "Increment the last integer on current line or the last integer on each line of a region"
  (interactive "r")
  (save-excursion
    (save-restriction
      (narrow-to-region p m)
      (goto-char (point-min))
      (forward-line)
      (let ((counter 1))
        (while (not (eq (point)
                        (point-max)))
          (goto-char (point-at-eol))
          (search-backward-regexp "[^0-9][0-9]+" (point-at-bol) t)
          (let* ((this-num (string-to-number (match-string 0)))
                 (new-num-str (number-to-string (+ this-num
                                                   counter))))
            (replace-match new-num-str)
            (incf counter)
            (forward-line)))))))

;; ------------------
;; Empty boiler-plate
;; ------------------
(defun boiler-plate (p m)
  "testing"
  (interactive "r")
  (save-excursion
    (save-restriction
      (if (region-active-p)
          (message "Point is: %d  mark is: %d" p m)
          (message "Point is: %d" (point))
        ))))

;; -----------------
;; until i have something smarter -
;; don't have to remember this for new frames
;; -----------------
(defun fix-frame-font ()
  (interactive)
  (set-frame-font ":-*-Monaco-bold-normal-normal-*-13-*-*-*-m-0-iso10646-1"))

;; -----------------
;; print mode-map
;; e.g. (print-keymap 'isearch-mode-map)
;; -----------------
(defun print-keymap (keymap)
  (interactive "Mprint keymap:")
  (princ (substitute-command-keys (format "\\{%s}" keymap)))
  t)

;; -----------------
;; Kill stray *ag search... buffers
;; -----------------
(defun kill-ag-buffers ()
  (interactive)
  (let ((buf-list (buffer-list)))
    (while buf-list
      (let ((buffer (car buf-list)))
        (if (string-match "^\\*ag search" (buffer-name buffer))
            (kill-buffer buffer)))
      (setq buf-list (cdr buf-list)))
    (message "Killed *ag search...* buffers")))

;;;
;;; Keyboard macros
;;;

;; ------------------
;; Replace ':' with '\n'
;; ------------------
(fset 'path-expand
   "\C-s:\C-m\C-?\C-j")

;; ------------------
;; Replace '\n' with ':'
;; ------------------
(fset 'path-collapse
   "\C-e\C-d:")

;; -----------------
;; remove 'debugger' lines
;; -----------------
(fset 'remove-debuggers
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ("\274^ *debugger *$" 0 "%d")) arg)))

;; for chef, change e.g. node[:foo][:bar] to node['foo']['bar']
;; Not smart, no error/context checking
(fset 'symbol-to-quote-hashes
   [?\C-s ?: return backspace ?\C-  ?\C-s ?\] return ?\C-b ?\'])

(defun kpc (arg char)
  (interactive "p\ncenter char: ")
  (message "you said: %s" char))

;; for expanding and contracting url-encoded POST bodies in restclient
;;; e.g. back and forth between
;;;
;;; foo=bar&baz=quux
;;;     AND
;;; foo=bar
;;; baz=quux
(defun dm/post-body-toggle ()
  (interactive)
  (save-restriction
    (narrow-to-region (region-beginning) (region-end))
    (goto-char (point-min))
    (let ((to-find "") (replace-with "") (newline "
"))
      (if (eq (search-forward "&" nil t) nil)
          (progn (setq to-find newline) (setq replace-with "&"))
          (progn (setq replace-with newline) (setq to-find "&")))
      (goto-char (point-min))
      (while (search-forward to-find nil t)
        (replace-match replace-with))
      (goto-char (- (point-max) 1))
      (if (looking-at "&") ; no dangling '&'
          (delete-char 1)))))

;;
;; Load an .envrc or similar. Right now exports 'export ' at the beginning
;; of lines, but can easily be updated
;; TODO: handle (ignore) commented lines
(defun dm/load-env-file (filename)
 "load a list of environment variables from a file, like from an .envrc file"
 (interactive "Fenv file:")
 (with-temp-buffer
   (insert-file-contents filename)
   (mapc (function (lambda (line)
                     (let ((parts (split-string line "=" t))
                           (env-var (replace-regexp-in-string "^[[:space:]]*export " "" (car (split-string line "=" t))))
                           (env-value (cadr (split-string line "=" t))))
                       (message "Setting env [ %s ] to [ %s ]" env-var env-value)
                       (setenv env-var env-value))))
         (split-string (buffer-string) "\n" t)))
 (message "variables from %s added to environment" filename))

;;; fd csv line -> payment
(fset 'olde-fdx-recon
   (kmacro-lambda-form [?\C-s ?g ?i ?g ?s return ?\M-k ?p ?t ?s ?  ?< ?< ?\S-  ?A ?d ?d ?i ?t ?i ?o ?n ?a ?l ?G ?i ?g ?D ?i ?s ?b ?u ?r ?s ?e ?m ?e ?n ?t ?. ?n ?e ?w ?\( ?G ?i ?g ?. ?f ?i ?n ?d ?\( ?\C-d ?\C-s ?, return backspace ?\) ?, ?\C-d ?  ?\C-s ?, return ?\C-d ?  ?\C-s ?, return backspace ?\) ?. ?p ?r ?o ?c ?e ?s ?s ?\C-k ?\C-n ?\C-a] 0 "%d"))

(fset 'fdx-recon2
   (kmacro-lambda-form [?\C-  ?\C-s ?g ?i ?g ?s return ?\C-d ?p ?t ?s ?  ?< ?< ?\S-  ?A ?d ?d ?i ?t ?i ?o ?n ?a ?l ?G ?i ?g ?D ?i ?s ?b ?u ?r ?s ?e ?m ?e ?n ?t ?. ?n ?e ?w ?\( ?\C-d ?G ?i ?g ?. ?f ?i ?n ?d ?\( ?\C-s ?, return ?\C-b ?\) ?\C-f ?  ?\C-d ?\C-s ?, return ?\C-k ?  ?0 ?. ?0 ?0 ?\) ?. ?p ?r ?o ?c ?e ?s ?s ?\C-n ?\C-a] 0 "%d"))

;;; wmt csv line -> payment
(fset 'wmt-recon
   (kmacro-lambda-form [?\C-s ?g ?i ?g ?s return ?\C-d ?\M-k ?p ?t ?s ?  ?< ?< ?\S-  ?A ?d ?d ?i ?t ?i ?o ?n ?a ?l ?G ?i ?g ?D ?i ?s ?b ?u ?r ?s ?e ?m ?e ?n ?t ?. ?n ?e ?w ?\( ?G ?i ?g ?. ?f ?i ?n ?d ?\( ?\C-s ?, return backspace ?\) ?  backspace ?, ?  ?\C-d ?\C-s ?, return ?  ?0 ?. ?0 ?0 ?\) ?. ?p ?r ?o ?c ?e ?s ?s ?\C-k ?\C-n ?\C-a] 0 "%d"))
