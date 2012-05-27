;;; .loaddefs.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (ack) "../../proj/stuff/dotFiles/.emacs.d/el-get/ack/ack"
;;;;;;  "ack/ack.el" "381a11bb6d6d952b3720ef66c3927e0c")
;;; Generated autoloads from ack/ack.el

(autoload 'ack "../../proj/stuff/dotFiles/.emacs.d/el-get/ack/ack" "\


\(fn COMMAND-ARGS)" t nil)

;;;***

;;;### (autoloads (auto-indent-global-mode auto-indent-minor-mode-on
;;;;;;  auto-indent-eol-char-newline auto-indent-eol-newline) "auto-indent-mode/auto-indent-mode"
;;;;;;  "../../../../../.emacs.d/el-get/auto-indent-mode/auto-indent-mode.el"
;;;;;;  "7d9ac4726f443f29ba60ebb2229e927f")
;;; Generated autoloads from ../../../../../.emacs.d/el-get/auto-indent-mode/auto-indent-mode.el

(autoload 'auto-indent-eol-newline "auto-indent-mode/auto-indent-mode" "\
*Auto-indent function for end-of-line and then newline.

\(fn)" t nil)

(autoload 'auto-indent-eol-char-newline "auto-indent-mode/auto-indent-mode" "\
* Auto-indent function for end-of-line, insert `auto-indent-eol-char', and then newline

\(fn)" t nil)

(defalias 'auto-indent-mode 'auto-indent-minor-mode)

(autoload 'auto-indent-minor-mode-on "auto-indent-mode/auto-indent-mode" "\
* Turn on auto-indent minor mode.

\(fn)" nil nil)

(defvar auto-indent-global-mode nil "\
Non-nil if Auto-Indent-Global mode is enabled.
See the command `auto-indent-global-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `auto-indent-global-mode'.")

(custom-autoload 'auto-indent-global-mode "auto-indent-mode/auto-indent-mode" nil)

(autoload 'auto-indent-global-mode "auto-indent-mode/auto-indent-mode" "\
Toggle Auto-Indent minor mode in all buffers.
With prefix ARG, enable Auto-Indent-Global mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Auto-Indent minor mode is enabled in all buffers where
`auto-indent-minor-mode-on' would do it.
See `auto-indent-minor-mode' for more information on Auto-Indent minor mode.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (Buffer-menu-mouse-execute Buffer-menu-mouse-modified
;;;;;;  Buffer-menu-mouse-delete Buffer-menu-mouse-save Buffer-menu-mouse-unmark
;;;;;;  Buffer-menu-mouse-other-window Buffer-menu-mouse-3-menu Buffer-menu-select
;;;;;;  Buffer-menu-execute Buffer-menu-delete-flagged buffer-menu)
;;;;;;  "buff-menu+/buff-menu+" "../../../../../.emacs.d/el-get/buff-menu+/buff-menu+.el"
;;;;;;  "33d977c1a87a9f8e25651451c4066697")
;;; Generated autoloads from ../../../../../.emacs.d/el-get/buff-menu+/buff-menu+.el

(autoload 'buffer-menu "buff-menu+/buff-menu+" "\
Show a menu to let you save, delete or select buffers.
By default (no or null prefix arg), the buffers are listed in order of
last access (visit).  With a non-nil prefix ARG:
  ARG >= 0  means only buffers visiting files are listed.
  ARG <= 0  means the buffers are listed alphabetically.
 (ARG = 0   means only buffers visiting files, listed alphabetically.)

Type `?' in buffer \"*Buffer List*\" for more information.
Type `q' there to quit the buffer menu.

\(fn &optional ARG)" t nil)

(autoload 'Buffer-menu-delete-flagged "buff-menu+/buff-menu+" "\
Delete all buffers marked `D', even if they have been modified.
If there are any file buffers that have been modified since the last
save, then you must confirm the deletion of all at once.

You can mark a buffer for deletion (`D') using command `\\<Buffer-menu-mode-map>\\[Buffer-menu-delete]'.

\(fn)" t nil)

(autoload 'Buffer-menu-execute "buff-menu+/buff-menu+" "\
Save or delete buffers marked `S' (\"save\") or `D' (\"delete\").
Buffers can be so marked using commands `\\<Buffer-menu-mode-map>\\[Buffer-menu-save]' and `\\[Buffer-menu-delete]', respectively.

\(fn)" t nil)

(autoload 'Buffer-menu-select "buff-menu+/buff-menu+" "\
Select this line's buffer; also display buffers marked with `>'.
You can mark buffers with command `\\<Buffer-menu-mode-map>\\[Buffer-menu-mark]'.
If the window is `window-dedicated-p', then another window is used;
else, all windows previously in the frame are replaced by this one.

\(fn)" t nil)

(autoload 'Buffer-menu-mouse-3-menu "buff-menu+/buff-menu+" "\
Pop up menu for Mouse-3 for buffer listed in buffer menu.

\(fn EVENT)" t nil)

(autoload 'Buffer-menu-mouse-other-window "buff-menu+/buff-menu+" "\
Select, in another window, the buffer on whose line you click.

\(fn EVENT)" t nil)

(autoload 'Buffer-menu-mouse-unmark "buff-menu+/buff-menu+" "\
Cancel all requested operations on buffer.

\(fn EVENT)" t nil)

(autoload 'Buffer-menu-mouse-save "buff-menu+/buff-menu+" "\
Mark buffer to be saved.
Actual deletion is done via `\\<Buffer-menu-mode-map>\\[Buffer-menu-execute]' or `\\<Buffer-menu-mode-map>\\[Buffer-menu-mouse-execute]'.

\(fn EVENT)" t nil)

(autoload 'Buffer-menu-mouse-delete "buff-menu+/buff-menu+" "\
Mark buffer to be deleted.
Actual deletion is done via `\\<Buffer-menu-mode-map>\\[Buffer-menu-execute]' or `\\<Buffer-menu-mode-map>\\[Buffer-menu-mouse-execute]'.

\(fn EVENT)" t nil)

(autoload 'Buffer-menu-mouse-modified "buff-menu+/buff-menu+" "\
Mark buffer as unmodified (no changes to save) if modified, and vice versa.

\(fn EVENT)" t nil)

(autoload 'Buffer-menu-mouse-execute "buff-menu+/buff-menu+" "\
Save and/or delete buffers marked `S' or `D', respectively.
Buffers can be marked via commands `\\<Buffer-menu-mode-map>\\[Buffer-menu-save]' and `\\<Buffer-menu-mode-map>\\[Buffer-menu-delete]'
\(or `\\<Buffer-menu-mode-map>\\[Buffer-menu-mouse-save]' and `\\<Buffer-menu-mode-map>\\[Buffer-menu-mouse-delete]').

\(fn EVENT)" t nil)

;;;***

;;;### (autoloads (color-theme-desert) "color-theme-desert/color-theme-desert"
;;;;;;  "color-theme-desert/color-theme-desert.el" (20142 39022))
;;; Generated autoloads from color-theme-desert/color-theme-desert.el

(autoload 'color-theme-desert "color-theme-desert/color-theme-desert" "\
Emacs color theme desert, inspired by VIM desert theme.

\(fn)" t nil)

;;;***

;;;### (autoloads (color-theme-solarized-light color-theme-solarized-dark
;;;;;;  color-theme-solarized) "color-theme-solarized/color-theme-solarized"
;;;;;;  "color-theme-solarized/color-theme-solarized.el" (20142 39029))
;;; Generated autoloads from color-theme-solarized/color-theme-solarized.el

(autoload 'color-theme-solarized "color-theme-solarized/color-theme-solarized" "\
Color theme by Ethan Schoonover, created 2011-03-24.
Ported to Emacs by Greg Pfeil, http://ethanschoonover.com/solarized.

\(fn MODE)" t nil)

(autoload 'color-theme-solarized-dark "color-theme-solarized/color-theme-solarized" "\


\(fn)" t nil)

(autoload 'color-theme-solarized-light "color-theme-solarized/color-theme-solarized" "\


\(fn)" t nil)

;;;***

;;;### (autoloads (color-theme-zenburn) "color-theme-zenburn/zenburn"
;;;;;;  "color-theme-zenburn/zenburn.el" (20142 39016))
;;; Generated autoloads from color-theme-zenburn/zenburn.el

(autoload 'color-theme-zenburn "color-theme-zenburn/zenburn" "\
Just some alien fruit salad to keep you in the zone.

\(fn)" t nil)

;;;***

;;;### (autoloads (color-theme-initialize color-theme-submit color-theme-install
;;;;;;  color-theme-compare color-theme-make-snapshot color-theme-analyze-defun
;;;;;;  color-theme-print color-theme-install-at-point-for-current-frame
;;;;;;  color-theme-install-at-mouse color-theme-describe color-theme-select)
;;;;;;  "color-theme/color-theme" "color-theme/color-theme.el" (17529
;;;;;;  41105))
;;; Generated autoloads from color-theme/color-theme.el

(autoload 'color-theme-select "color-theme/color-theme" "\
Displays a special buffer for selecting and installing a color theme.
With optional prefix ARG, this buffer will include color theme libraries
as well.  A color theme library is in itself not complete, it must be
used as part of another color theme to be useful.  Thus, color theme
libraries are mainly useful for color theme authors.

\(fn &optional ARG)" t nil)

(autoload 'color-theme-describe "color-theme/color-theme" "\
Describe color theme listed at point.
This shows the documentation of the value of text-property color-theme
at point.  The text-property color-theme should be a color theme
function.  See `color-themes'.

\(fn)" t nil)

(autoload 'color-theme-install-at-mouse "color-theme/color-theme" "\
Install color theme clicked upon using the mouse.
First argument EVENT is used to set point.  Then
`color-theme-install-at-point' is called.

\(fn EVENT)" t nil)

(autoload 'color-theme-install-at-point-for-current-frame "color-theme/color-theme" "\
Install color theme at point for current frame only.
Binds `color-theme-is-global' to nil and calls
`color-theme-install-at-point'.

\(fn)" t nil)

(autoload 'color-theme-print "color-theme/color-theme" "\
Print the current color theme function.

You can contribute this function to <URL:news:gnu.emacs.sources> or
paste it into your .emacs file and call it.  That should recreate all
the settings necessary for your color theme.

Example:

    (require 'color-theme)
    (defun my-color-theme ()
      \"Color theme by Alex Schroeder, created 2000-05-17.\"
      (interactive)
      (color-theme-install
       '(...
	 ...
	 ...)))
    (my-color-theme)

If you want to use a specific color theme function, you can call the
color theme function in your .emacs directly.

Example:

    (require 'color-theme)
    (color-theme-gnome2)

\(fn &optional BUF)" t nil)

(autoload 'color-theme-analyze-defun "color-theme/color-theme" "\
Once you have a color-theme printed, check for missing faces.
This is used by maintainers who receive a color-theme submission
and want to make sure it follows the guidelines by the color-theme
author.

\(fn)" t nil)

(autoload 'color-theme-make-snapshot "color-theme/color-theme" "\
Return the definition of the current color-theme.
The function returned will recreate the color-theme in use at the moment.

\(fn)" nil nil)

(autoload 'color-theme-compare "color-theme/color-theme" "\
Compare two color themes.
This will print the differences between installing THEME-A and
installing THEME-B.  Note that the order is important: If a face is
defined in THEME-A and not in THEME-B, then this will not show up as a
difference, because there is no reset before installing THEME-B.  If a
face is defined in THEME-B and not in THEME-A, then this will show up as
a difference.

\(fn THEME-A THEME-B)" t nil)

(autoload 'color-theme-install "color-theme/color-theme" "\
Install a color theme defined by frame parameters, variables and faces.

The theme is installed for all present and future frames; any missing
faces are created.  See `color-theme-install-faces'.

THEME is a color theme definition.  See below for more information.

If you want to install a color theme from your .emacs, use the output
generated by `color-theme-print'.  This produces color theme function
which you can copy to your .emacs.

A color theme definition is a list:
\([FUNCTION] FRAME-PARAMETERS VARIABLE-SETTINGS FACE-DEFINITIONS)

FUNCTION is the color theme function which called `color-theme-install'.
This is no longer used.  There was a time when this package supported
automatic factoring of color themes.  This has been abandoned.

FRAME-PARAMETERS is an alist of frame parameters.  These are installed
with `color-theme-install-frame-params'.  These are installed last such
that any changes to the default face can be changed by the frame
parameters.

VARIABLE-DEFINITIONS is an alist of variable settings.  These are
installed with `color-theme-install-variables'.

FACE-DEFINITIONS is an alist of face definitions.  These are installed
with `color-theme-install-faces'.

If `color-theme-is-cumulative' is nil, a color theme will undo face and
frame-parameter settings of previous color themes.

\(fn THEME)" nil nil)

(autoload 'color-theme-submit "color-theme/color-theme" "\
Submit your color-theme to the maintainer.

\(fn)" t nil)

(autoload 'color-theme-initialize "color-theme/color-theme" "\
Initialize the color theme package by loading color-theme-libraries.

\(fn)" t nil)

;;;***

;;;### (autoloads (revert-buffer-no-confirm clear-search-histories
;;;;;;  clear-regexp-search-history clear-search-history indirect-buffer
;;;;;;  kill-buffer-and-its-windows chown chgrp chmod region-to-file
;;;;;;  region-to-buffer delete-lines goto-long-line goto-longest-line
;;;;;;  region-length mark-buffer-before-point mark-buffer-after-point
;;;;;;  recenter-top-bottom-2 recenter-top-bottom-1 recenter-top-bottom
;;;;;;  beginning-or-indentation beginning-of-line+ end-of-line+
;;;;;;  forward-char-same-line forward-overlay view-X11-colors) "misc-cmds/misc-cmds"
;;;;;;  "misc-cmds/misc-cmds.el" (20150 41216))
;;; Generated autoloads from misc-cmds/misc-cmds.el

(autoload 'view-X11-colors "misc-cmds/misc-cmds" "\
View file `/usr/lib/X11/rgb.txt', which lists available X11 colors.

\(fn)" t nil)

(autoload 'forward-overlay "misc-cmds/misc-cmds" "\
Move forward ARG overlays.
Move cursor to next position where an overlay starts or ends.
If there are no more overlay boundaries, move to (point-max).

\(fn &optional ARG)" t nil)

(autoload 'forward-char-same-line "misc-cmds/misc-cmds" "\
Move forward a max of ARG chars on the same line, or backward if ARG < 0.
Returns the signed number of chars moved if /= ARG, else returns nil.

\(fn &optional ARG)" t nil)

(autoload 'end-of-line+ "misc-cmds/misc-cmds" "\
Move cursor to end of current line or end of next line if repeated.
This is similar to `end-of-line', but:
  If called interactively with no prefix arg:
     If the previous command was also `end-of-line+', then move to the
     end of the next line.  Else, move to the end of the current line.
  Otherwise, move to the end of the Nth next line (Nth previous line
     if N<0).  Command `end-of-line', by contrast, moves to the end of
     the (N-1)th next line.

\(fn &optional N)" t nil)

(autoload 'beginning-of-line+ "misc-cmds/misc-cmds" "\
Move cursor to beginning of current line or next line if repeated.
This is the similar to `beginning-of-line', but:
1. With arg N, the direction is the opposite: this command moves
   backward, not forward, N lines.
2. If called interactively with no prefix arg:
      If the previous command was also `beginning-of-line+', then move
      to the beginning of the previous line.  Else, move to the
      beginning of the current line.
   Otherwise, move to the beginning of the Nth previous line (Nth next
      line if N<0).  Command `beginning-of-line', by contrast, moves to
      the beginning of the (N-1)th next line.

\(fn &optional N)" t nil)

(autoload 'beginning-or-indentation "misc-cmds/misc-cmds" "\
Move cursor to beginning of this line or to its indentation.
If at indentation position of this line, move to beginning of line.
If at beginning of line, move to beginning of previous line.
Else, move to indentation position of this line.

With arg N, move backward to the beginning of the Nth previous line.
Interactively, N is the prefix arg.

\(fn &optional N)" t nil)

(autoload 'recenter-top-bottom "misc-cmds/misc-cmds" "\
Move current line to window center, top, and bottom, successively.
With a prefix argument, this is the same as `recenter':
 With numeric prefix ARG, move current line to window-line ARG.
 With plain `C-u', move current line to window center.

Otherwise move current line to window center on first call, and to
top, middle, or bottom on successive calls.

The starting position of the window determines the cycling order:
 If initially in the top or middle third: top -> middle -> bottom.
 If initially in the bottom third: bottom -> middle -> top.

Top and bottom destinations are actually `scroll-conservatively' lines
from true window top and bottom.

\(fn &optional ARG)" t nil)

(autoload 'recenter-top-bottom-1 "misc-cmds/misc-cmds" "\
Move current line to window center, top, and bottom, successively.
With prefix ARG, move current line to window-line ARG.
Top and bottom destinations are actually `scroll-conservatively' lines
from true top and bottom.

\(fn &optional ARG)" t nil)

(autoload 'recenter-top-bottom-2 "misc-cmds/misc-cmds" "\
Move current line to line ARG, window center, top, or bottom.
With a prefix argument, this is the same as `recenter':
 With numeric prefix ARG, move current line to window-line ARG.
 With plain `C-u', move current line to window center.

Otherwise, the window starting position determines the next position:
 If in the top third, move to bottom.
 If in middle third,  move to top.
 If in bottom third,  move tocenter.

Top and bottom destinations are actually `scroll-conservatively' lines
from true top and bottom.

\(fn &optional ARG)" t nil)

(autoload 'mark-buffer-after-point "misc-cmds/misc-cmds" "\
Select the part of the buffer after point.
With a prefix argument, select the part before point.

\(fn REVERSEP)" t nil)

(autoload 'mark-buffer-before-point "misc-cmds/misc-cmds" "\
Select the part of the buffer before point.
With a prefix argument, select the part after point.

\(fn REVERSEP)" t nil)

(defalias 'selection-length 'region-length)

(defalias 'count-chars-in-region 'region-length)

(autoload 'region-length "misc-cmds/misc-cmds" "\
Display the number of characters in the region in a message.

\(fn)" t nil)

(autoload 'goto-longest-line "misc-cmds/misc-cmds" "\
Go to the first of the longest lines in the region or buffer.
If the region is active, it is checked.
If not, the buffer (or its restriction) is checked.

Returns a list of three elements:

 (LINE LINE-LENGTH OTHER-LINES LINES-CHECKED)

LINE is the first of the longest lines measured.
LINE-LENGTH is the length of LINE.
OTHER-LINES is a list of other lines checked that are as long as LINE.
LINES-CHECKED is the number of lines measured.

Interactively, a message displays this information.

If there is only one line in the active region, then the region is
deactivated after this command, and the message mentions only LINE and
LINE-LENGTH.

If this command is repeated, it checks for the longest line after the
cursor.  That is *not* necessarily the longest line other than the
current line.  That longest line could be before or after the current
line.

To search only from the current line forward, not throughout the
buffer, you can use `C-SPC' to set the mark, then use this
\(repeatedly).

\(fn BEG END)" t nil)

(autoload 'goto-long-line "misc-cmds/misc-cmds" "\
Go to the first line that is at least LEN characters long.
Use a prefix arg to provide LEN.
Plain `C-u' (no number) uses `fill-column' as LEN.

\(fn LEN)" t nil)

(autoload 'delete-lines "misc-cmds/misc-cmds" "\
Delete NUM-LINES lines, starting at point.
Lines are deleted, not killed.
With positive prefix arg, deletion is forward.
With negative prefix arg, deletion is backward.

\(fn NUM-LINES)" t nil)

(autoload 'region-to-buffer "misc-cmds/misc-cmds" "\
Copy region to BUFFER: At beginning (prefix >= 0), end (< 0), or replace.
START and END are the region boundaries.
BUFFER is a buffer or its name (a string).
With prefix ARG >= 0: `append-to-buffer':
  Append contents of region to end of BUFFER.
  (Point is moved to end of BUFFER first.)
With prefix ARG < 0:  `prepend-to-buffer':
  Prepend contents of region to beginning of BUFFER.
  (Point is moved to beginning of BUFFER first.)
With no prefix ARG (nil): `copy-to-buffer'.
  Write region to BUFFER, replacing any previous contents.

\(fn START END BUFFER ARG)" t nil)

(autoload 'region-to-file "misc-cmds/misc-cmds" "\
With prefix arg, this is `append-to-file'.  Without, it is `write-region'.
START and END are the region boundaries.
Prefix ARG non-nil means append region to end of file FILENAME.
Prefix ARG nil means write region to FILENAME, replacing contents.

\(fn START END FILENAME ARG)" t nil)

(autoload 'chmod "misc-cmds/misc-cmds" "\
Execute Unix command `chmod'.  Current buffer's file is default arg.
CMD is the command to execute (interactively, `chmod').

\(fn CMD)" t nil)

(autoload 'chgrp "misc-cmds/misc-cmds" "\
Execute Unix command `chgrp'.  Current buffer's file is default arg.
CMD is the command to execute (interactively, `chgrp').

\(fn CMD)" t nil)

(autoload 'chown "misc-cmds/misc-cmds" "\
Execute Unix command `chown'.  Current buffer's file is default arg.
CMD is the command to execute (interactively, `chown').

\(fn CMD)" t nil)

(autoload 'kill-buffer-and-its-windows "misc-cmds/misc-cmds" "\
Kill BUFFER and delete its windows.  Default is `current-buffer'.
BUFFER may be either a buffer or its name (a string).

\(fn BUFFER)" t nil)

(autoload 'indirect-buffer "misc-cmds/misc-cmds" "\
Edit stuff in this buffer in an indirect-buffer window.
The indirect buffer can have a different major mode from current.

\(fn)" t nil)

(defalias 'clear-search-ring 'clear-search-history)

(autoload 'clear-search-history "misc-cmds/misc-cmds" "\
Clear the search history (empty it).
With prefix arg, clear also the regular-expression search history.

\(fn &optional REGEXP-TOO-P)" t nil)

(defalias 'clear-regexp-search-ring 'clear-regexp-search-history)

(autoload 'clear-regexp-search-history "misc-cmds/misc-cmds" "\
Clear the regular-expression search history (empty it).
With prefix arg, clear also the simple search history.

\(fn &optional SIMPLE-TOO-P)" t nil)

(autoload 'clear-search-histories "misc-cmds/misc-cmds" "\
Clear both search histories: simple search and regexp search.

\(fn)" t nil)

(autoload 'revert-buffer-no-confirm "misc-cmds/misc-cmds" "\
Revert buffer without confirmation.

\(fn)" t nil)

;;;***

;;;### (autoloads nil nil ("../../../../../.emacs.d/el-get/auto-indent-mode/auto-indent-mode.el"
;;;;;;  "../../../../../.emacs.d/el-get/autopair/autopair.el" "../../../../../.emacs.d/el-get/buff-menu+/buff-menu+.el"
;;;;;;  "color-theme-ahei/color-theme-ahei.el" "color-theme-chocolate-rain/color-theme-chocolate-rain.el"
;;;;;;  "color-theme-domq/color-theme-domq.el" "color-theme-emacs-revert-theme/color-theme-emacs-revert-theme.el"
;;;;;;  "color-theme-empty-void/color-theme-empty-void.el" "color-theme-inkpot/color-theme-inkpot.el"
;;;;;;  "color-theme-ir-black/color-theme-ir-black.el" "color-theme-mac-classic/color-theme-mac-classic.el"
;;;;;;  "color-theme-maker/color-theme-maker.el" "color-theme-railscasts/color-theme-railscasts.el"
;;;;;;  "color-theme-reg/color-theme-reg.el" "color-theme-sanityinc/color-theme-sanityinc.el"
;;;;;;  "color-theme-solarized/solarized-dark-theme.el" "color-theme-solarized/solarized-definitions.el"
;;;;;;  "color-theme-solarized/solarized-light-theme.el" "color-theme-subdued/color-theme-subdued.el"
;;;;;;  "color-theme-tango-2/color-theme-tango-2.el" "color-theme-tango/color-theme-tango.el"
;;;;;;  "color-theme-twilight/color-theme-twilight.el" "color-theme-ubuntu2/color-theme-ubuntu2.el"
;;;;;;  "color-theme-vim-insert-mode/color-theme-vim-insert-mode.el"
;;;;;;  "color-theme-x/color-theme-x.el" "color-theme-zen-and-art/zen-and-art.el"
;;;;;;  "color-theme/color-theme-autoloads.el") (20202 2048 621319))

;;;***

(provide '.loaddefs)
;; Local Variables:
;; version-control: never
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; .loaddefs.el ends here
