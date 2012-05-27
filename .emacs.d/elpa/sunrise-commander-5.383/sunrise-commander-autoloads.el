;;; sunrise-commander-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (sr-dired sunrise-cd sunrise) "sunrise-commander"
;;;;;;  "sunrise-commander.el" (20094 14895))
;;; Generated autoloads from sunrise-commander.el

(autoload 'sunrise "sunrise-commander" "\
Start the Sunrise Commander.
If LEFT-DIRECTORY is given, the left window will display that
directory (same for RIGHT-DIRECTORY). Specifying nil for any of
these values uses the default, ie. $HOME.

\(fn &optional LEFT-DIRECTORY RIGHT-DIRECTORY FILENAME)" t nil)

(autoload 'sunrise-cd "sunrise-commander" "\
Run Sunrise but give it the current directory to use.

\(fn)" t nil)

(autoload 'sr-dired "sunrise-commander" "\
Visit the given directory in `sr-mode'.

\(fn DIRECTORY &optional SWITCHES)" t nil)

;;;***

;;;### (autoloads nil nil ("sunrise-commander-pkg.el") (20094 14895
;;;;;;  194160))

;;;***

(provide 'sunrise-commander-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; sunrise-commander-autoloads.el ends here
