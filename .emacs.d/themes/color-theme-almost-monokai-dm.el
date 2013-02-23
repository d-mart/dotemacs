;;; Almost Monokai: color-theme-almost-monokai.el
;;; A beautiful, fruity and calm emacs color theme.

;; Modified by DM to have comment and doc faces match
;; and remove underlines for variable types.
;; change modeline
;; add faces for punct, numbers, searching, preprocs
;; and a bunch of other changes.  
;; 
;; Author: Prateek Saxena <prtksxna@gmail.com>
;; Author: Pratul Kalia   <pratul@pratul.in>
;;
;; Based on the Monokai TextMate theme
;; Author: Wimer Hazenberg <http://www.monokai.nl>
;;
;; Depends: color-theme

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

; Color theme support is required.
(require 'color-theme)

; Code start.
(defun color-theme-almost-monokai-dm ()
  (interactive)
  (color-theme-install
   '(color-theme-almost-monokai-dm
     ((background-color . "#272821")
      (foreground-color . "#F8F8F2")
      (cursor-color . "#DAD085"))
     (default ((nil (nil))))   ; was default t nil - trying to not override e.g. buff-menu+, iswitchb, etc
     ;; see http://www.gnu.org/software/emacs/manual/html_node/emacs/Standard-Faces.html
     ;(modeline ((t (:background "#335599" :foreground "black" :box (:line-width 2 :style released-button)))))
     (modeline ((t (:background "#223355" :foreground "#CCCCCC" :box (:line-width 2 :style released-button)))))
     (modeline-inactive ((t (:background "#272821" :foreground "#AAAAAA" :box (:line-width 2 :style released-button)))))
     (fringe ((t (:foreground "#272821"))))
     (font-lock-builtin-face ((t (:foreground "#A6E22A"))))
     (font-lock-comment-face ((t (:italic t :foreground "#75715D"))))
     (font-lock-comment-delimiter-face ((t (:foreground "#75715D"))))
     (font-lock-doc-string-face ((t (:foreground "#75715D"))))
     (font-lock-doc-face ((t (:italic t :foreground "#75715D"))))
     (font-lock-string-face ((t (:foreground "#DFD874"))))
     (font-lock-constant-face ((t (:foreground "#A6E22A"))))
     (font-lock-function-name-face ((t (:foreground "#F1266F"))))
     (font-lock-keyword-face ((t (:foreground "#66D9EF"))))
     (font-lock-preprocessor-face ((t (:foreground "MediumOrchid1"))))
     (font-lock-type-face ((t (:foreground "#89BDFF"))))
     (font-lock-variable-name-face ((t (:foreground "#A6E22A"))))
     (font-lock-warning-face ((t (:bold t :foreground "#FD5FF1"))))
     ;(font-lock-punctuation-face ((t (:bold t))))
     (font-lock-punctuation-face ((t (:foreground "khaki"))))
     (font-lock-digit-face ((t (:foreground "gold2"))))
     (isearch ((t (:foreground "#272821" :background "#F8F8F2"))))
     (lazy-highlight ((t (:foreground "#272821" :background "#C8C8C2"))))
     (highlight-80+ ((t (:background "#D62E00"))))
     (hl-line ((t (:background "#1A1A1A"))))
     (region ((t (:background "#223355"))))
     (ido-subdir ((t (:foreground "#F1266F"))))
     (show-paren-match ((t (:underline t :foreground "red"))))
    )
  )
)
(provide 'color-theme-almost-monokai-dm)

;; Testing
;(set-face-background 'modeline "#223355")
;(set-face-foreground 'modeline "#CCCCCC")
;(set-face-background 'region   "#223355")
;---------------
; Code end.
