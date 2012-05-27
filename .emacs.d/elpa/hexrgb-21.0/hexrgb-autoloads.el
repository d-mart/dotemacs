;;; hexrgb-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (hexrgb-float-to-color-value hexrgb-color-value-to-float
;;;;;;  hexrgb-approx-equal hexrgb-int-to-hex hexrgb-hex-char-to-integer
;;;;;;  hexrgb-hex-to-int hexrgb-increment-hex hexrgb-increment-equal-rgb
;;;;;;  hexrgb-increment-blue hexrgb-increment-green hexrgb-increment-red
;;;;;;  hexrgb-hex-to-color-values hexrgb-color-values-to-hex hexrgb-color-name-to-hex
;;;;;;  hexrgb-hex-to-rgb hexrgb-hex-to-hsv hexrgb-rgb-to-hex hexrgb-hsv-to-hex
;;;;;;  hexrgb-hsv-to-rgb hexrgb-rgb-to-hsv hexrgb-blue hexrgb-green
;;;;;;  hexrgb-red hexrgb-value hexrgb-saturation hexrgb-hue hexrgb-complement
;;;;;;  hexrgb-rgb-hex-string-p hexrgb-read-color hexrgb-canonicalize-defined-colors-flag)
;;;;;;  "hexrgb" "hexrgb.el" (20080 37246))
;;; Generated autoloads from hexrgb.el

(defconst hexrgb-defined-colors (eval-when-compile (and window-system (x-defined-colors))) "\
List of all supported colors.")

(defconst hexrgb-defined-colors-no-dups (eval-when-compile (and window-system (hexrgb-canonicalize-defined-colors (x-defined-colors)))) "\
List of all supported color names, with no duplicates.
Names are all lowercase, without any spaces.")

(defconst hexrgb-defined-colors-alist (eval-when-compile (and window-system (mapcar #'list (x-defined-colors)))) "\
Alist of all supported color names, for use in completion.
See also `hexrgb-defined-colors-no-dups-alist', which is the same
thing, but without any duplicates, such as \"light blue\" and
\"LightBlue\".")

(defconst hexrgb-defined-colors-no-dups-alist (eval-when-compile (and window-system (mapcar #'list (hexrgb-canonicalize-defined-colors (x-defined-colors))))) "\
Alist of all supported color names, with no duplicates, for completion.
Names are all lowercase, without any spaces.")

(defvar hexrgb-canonicalize-defined-colors-flag t "\
*Non-nil means remove duplicate color names.
Names are considered duplicates if they are the same when abstracting
from whitespace and letter case.")

(custom-autoload 'hexrgb-canonicalize-defined-colors-flag "hexrgb" t)

(autoload 'hexrgb-read-color "hexrgb" "\
Read a color name or RGB hex value: #RRRRGGGGBBBB.
Completion is available for color names, but not for RGB hex strings.
If you input an RGB hex string, it must have the form #XXXXXXXXXXXX or
XXXXXXXXXXXX, where each X is a hex digit.  The number of Xs must be a
multiple of 3, with the same number of Xs for each of red, green, and
blue.  The order is red, green, blue.

Color names that are normally considered equivalent are canonicalized:
They are lowercased, whitespace is removed, and duplicates are
eliminated.  E.g. \"LightBlue\" and \"light blue\" are both replaced
by \"lightblue\".  If you do not want this behavior, but want to
choose names that might contain whitespace or uppercase letters, then
customize option `hexrgb-canonicalize-defined-colors-flag' to nil.

In addition to standard color names and RGB hex values, the following
are available as color candidates.  In each case, the corresponding
color is used.

* `*copied foreground*'  - last copied foreground, if available
* `*copied background*'  - last copied background, if available
* `*mouse-2 foreground*' - foreground where you click `mouse-2'
* `*mouse-2 background*' - background where you click `mouse-2'
* `*point foreground*'   - foreground under the cursor
* `*point background*'   - background under the cursor

\(You can copy a color using eyedropper commands such as
`eyedrop-pick-foreground-at-mouse'.)

Checks input to be sure it represents a valid color.  If not, raises
an error (but see exception for empty input with non-nil
ALLOW-EMPTY-NAME-P).

Interactively, or with optional arg CONVERT-TO-RGB-P non-nil, converts
an input color name to an RGB hex string.  Returns the RGB hex string.

Optional arg ALLOW-EMPTY-NAME-P controls what happens if you enter an
empty color name (that is, you just hit `RET').  If non-nil, then
`hexrgb-read-color' returns an empty color name, \"\".  If nil, then
it raises an error.  Programs must test for \"\" if ALLOW-EMPTY-NAME-P
is non-nil.  They can then perform an appropriate action in case of
empty input.

Optional arg PROMPT is the prompt.  Nil means use a default prompt.

\(fn &optional CONVERT-TO-RGB-P ALLOW-EMPTY-NAME-P PROMPT)" t nil)

(autoload 'hexrgb-rgb-hex-string-p "hexrgb" "\
Non-nil if COLOR is an RGB string #XXXXXXXXXXXX.
Each X is a hex digit.  The number of Xs must be a multiple of 3, with
the same number of Xs for each of red, green, and blue.

Non-nil optional arg LAXP means that the initial `#' is optional.  In
that case, for a valid string of hex digits: when # is present 0 is
returned; otherwise, t is returned.

\(fn COLOR &optional LAXP)" nil nil)

(autoload 'hexrgb-complement "hexrgb" "\
Return the color that is the complement of COLOR.

\(fn COLOR)" t nil)

(autoload 'hexrgb-hue "hexrgb" "\
Return the hue component of COLOR, in range 0 to 1 inclusive.
COLOR is a color name or hex RGB string that starts with \"#\".

\(fn COLOR)" t nil)

(autoload 'hexrgb-saturation "hexrgb" "\
Return the saturation component of COLOR, in range 0 to 1 inclusive.
COLOR is a color name or hex RGB string that starts with \"#\".

\(fn COLOR)" t nil)

(autoload 'hexrgb-value "hexrgb" "\
Return the value component of COLOR, in range 0 to 1 inclusive.
COLOR is a color name or hex RGB string that starts with \"#\".

\(fn COLOR)" t nil)

(autoload 'hexrgb-red "hexrgb" "\
Return the red component of COLOR, in range 0 to 1 inclusive.
COLOR is a color name or hex RGB string that starts with \"#\".

\(fn COLOR)" t nil)

(autoload 'hexrgb-green "hexrgb" "\
Return the green component of COLOR, in range 0 to 1 inclusive.
COLOR is a color name or hex RGB string that starts with \"#\".

\(fn COLOR)" t nil)

(autoload 'hexrgb-blue "hexrgb" "\
Return the blue component of COLOR, in range 0 to 1 inclusive.
COLOR is a color name or hex RGB string that starts with \"#\".

\(fn COLOR)" t nil)

(autoload 'hexrgb-rgb-to-hsv "hexrgb" "\
Convert RED, GREEN, BLUE components to HSV (hue, saturation, value).
Each input component is 0.0 to 1.0, inclusive.
Returns a list of HSV components of value 0.0 to 1.0, inclusive.

\(fn RED GREEN BLUE)" nil nil)

(autoload 'hexrgb-hsv-to-rgb "hexrgb" "\
Convert HUE, SATURATION, VALUE components to RGB (red, green, blue).
Each input component is 0.0 to 1.0, inclusive.
Returns a list of RGB components of value 0.0 to 1.0, inclusive.

\(fn HUE SATURATION VALUE)" nil nil)

(autoload 'hexrgb-hsv-to-hex "hexrgb" "\
Return the hex RBG color string for inputs HUE, SATURATION, VALUE.
The inputs are each in the range 0 to 1.
The output string is of the form \"#RRRRGGGGBBBB\".

\(fn HUE SATURATION VALUE)" nil nil)

(autoload 'hexrgb-rgb-to-hex "hexrgb" "\
Return the hex RBG color string for inputs RED, GREEN, BLUE.
The inputs are each in the range 0 to 1.
The output string is of the form \"#RRRRGGGGBBBB\".

\(fn RED GREEN BLUE)" nil nil)

(autoload 'hexrgb-hex-to-hsv "hexrgb" "\
Return a list of HSV (hue, saturation, value) color components.
Each component is a value from 0.0 to 1.0, inclusive.
COLOR is a color name or a hex RGB string that starts with \"#\" and
is followed by an equal number of hex digits for red, green, and blue
components.

\(fn COLOR)" nil nil)

(autoload 'hexrgb-hex-to-rgb "hexrgb" "\
Return a list of RGB (red, green, blue) color components.
Each component is a value from 0.0 to 1.0, inclusive.
COLOR is a color name or a hex RGB string that starts with \"#\" and
is followed by an equal number of hex digits for red, green, and blue
components.

\(fn COLOR)" nil nil)

(autoload 'hexrgb-color-name-to-hex "hexrgb" "\
Return the RGB hex string for the COLOR name, starting with \"#\".
If COLOR is already a string starting with \"#\", then just return it.

\(fn COLOR)" nil nil)

(autoload 'hexrgb-color-values-to-hex "hexrgb" "\
Convert list of rgb color VALUES to a hex string, #XXXXXXXXXXXX.
Each X in the string is a hexadecimal digit.
Input VALUES is as for the output of `x-color-values'.

\(fn VALUES)" nil nil)

(autoload 'hexrgb-hex-to-color-values "hexrgb" "\
Convert hex COLOR to a list of rgb color values.
COLOR is a hex rgb color string, #XXXXXXXXXXXX
Each X in the string is a hexadecimal digit.  There are 3N X's, N > 0.
The output list is as for `x-color-values'.

\(fn COLOR)" nil nil)

(autoload 'hexrgb-increment-red "hexrgb" "\
Increment red value of rgb string HEX by INCREMENT.
String HEX starts with \"#\".  Each color is NB-DIGITS hex digits long.
If optional arg WRAP-P is non-nil, then the result wraps around zero.
For example, incrementing \"#FFFFFFFFF\" by 1 will cause it to wrap
around to \"#000000000\".

\(fn HEX NB-DIGITS INCREMENT &optional WRAP-P)" nil nil)

(autoload 'hexrgb-increment-green "hexrgb" "\
Increment green value of rgb string HEX by INCREMENT.
String HEX starts with \"#\".  Each color is NB-DIGITS hex digits long.
For example, incrementing \"#FFFFFFFFF\" by 1 will cause it to wrap
around to \"#000000000\".

\(fn HEX NB-DIGITS INCREMENT &optional WRAP-P)" nil nil)

(autoload 'hexrgb-increment-blue "hexrgb" "\
Increment blue value of rgb string HEX by INCREMENT.
String HEX starts with \"#\".  Each color is NB-DIGITS hex digits long.
For example, incrementing \"#FFFFFFFFF\" by 1 will cause it to wrap
around to \"#000000000\".

\(fn HEX NB-DIGITS INCREMENT &optional WRAP-P)" nil nil)

(autoload 'hexrgb-increment-equal-rgb "hexrgb" "\
Increment each color value (r,g,b) of rgb string HEX by INCREMENT.
String HEX starts with \"#\".  Each color is NB-DIGITS hex digits long.
For example, incrementing \"#FFFFFFFFF\" by 1 will cause it to wrap
around to \"#000000000\".

\(fn HEX NB-DIGITS INCREMENT &optional WRAP-P)" nil nil)

(autoload 'hexrgb-increment-hex "hexrgb" "\
Increment HEX number (a string NB-DIGITS long) by INCREMENT.
For example, incrementing \"FFFFFFFFF\" by 1 will cause it to wrap
around to \"000000000\".

\(fn HEX INCREMENT NB-DIGITS &optional WRAP-P)" nil nil)

(autoload 'hexrgb-hex-to-int "hexrgb" "\
Convert HEX string argument to an integer.
The characters of HEX must be hex characters.

\(fn HEX)" nil nil)

(autoload 'hexrgb-hex-char-to-integer "hexrgb" "\
Take a CHARACTER and return its value as if it were a hex digit.

\(fn CHARACTER)" nil nil)

(autoload 'hexrgb-int-to-hex "hexrgb" "\
Convert integer argument INT to a #XXXXXXXXXXXX format hex string.
Each X in the output string is a hexadecimal digit.
NB-DIGITS is the number of hex digits.  If INT is too large to be
represented with NB-DIGITS, then the result is truncated from the
left.  So, for example, INT=256 and NB-DIGITS=2 returns \"00\", since
the hex equivalent of 256 decimal is 100, which is more than 2 digits.

\(fn INT &optional NB-DIGITS)" nil nil)

(autoload 'hexrgb-approx-equal "hexrgb" "\
Return non-nil if numbers X and Y are approximately equal.
RFUZZ is a relative fuzz factor.  AFUZZ is an absolute fuzz factor.
RFUZZ defaults to 1.0e-8.  AFUZZ defaults to (/ RFUZZ 10).
RFUZZ and AFUZZ are converted to their absolute values.
The algorithm is:
 (< (abs (- X Y)) (+ AFUZZ (* RFUZZ (+ (abs X) (abs Y))))).

\(fn X Y &optional RFUZZ AFUZZ)" nil nil)

(autoload 'hexrgb-color-value-to-float "hexrgb" "\
Return the floating-point equivalent of color value N.
N must be an integer between 0 and 65535, or else an error is raised.

\(fn N)" nil nil)

(autoload 'hexrgb-float-to-color-value "hexrgb" "\
Return the color value equivalent of floating-point number X.
X must be between 0.0 and 1.0, or else an error is raised.

\(fn X)" nil nil)

;;;***

;;;### (autoloads nil nil ("hexrgb-pkg.el") (20080 37246 949216))

;;;***

(provide 'hexrgb-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; hexrgb-autoloads.el ends here
