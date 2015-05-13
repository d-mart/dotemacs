(defun select-current-line ()
  "Set the region to the entire current line"
  (interactive)
  (transient-mark-mode 1)
  (end-of-line)
  (set-mark (line-beginning-position)))

(defun select-another-line ()
  "Move the mark to the end of the next line"
  (interactive)
  (forward-line 1)
  (end-of-line))

(defun select-current-word ()
  "Set the region to the current word"
  (interactive)
  (transient-mark-mode 1)
  (let (pt)
    (skip-chars-backward "-_A-Za-z0-9")
    (setq pt (point))
    (skip-chars-forward "-_A-Za-z0-9")
    (set-mark pt)))

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
  (mapcar (lambda (x) (kill-buffer x)) (buffer-list)) ; kill all buffers
  (delete-other-windows)  ; kill all other windows
  (switch-to-buffer "*scratch*")) ; create new *scratch* buffer

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
(defun back-to-indentation-or-beginning () (interactive)
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
  (interactive)
  (princ (substitute-command-keys (format "\\{%s}" keymap)))
  t)



;;;
;;; Keyboard macros
;;;

;; ------------------
;; Keyboard macro to get story number from branch name
;; in COMMIT_MSG buffers and insert it at the begginging
;; of the commit comment
;; ------------------
(fset 'commit-msg-insert-story-number
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([19 98 114 97 110 99 104 32 91 48 45 57 93 13 2 67108896 134217830 17 134217788 91 35 25 93 32] 0 "%d")) arg)))

(require 'git-commit-mode) ;; TODO put some wrapping around this two lines
(define-key git-commit-mode-map (kbd "C-c m") 'commit-msg-insert-story-number)

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
