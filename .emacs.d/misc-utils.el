;; misc-utils.el
;; Various handy functions found in travels across the intarbwebs

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
