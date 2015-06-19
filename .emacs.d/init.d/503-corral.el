(use-package corral
  :init
  (progn ())

  :bind
  (("s-["  . corral-brackets-backward)
   ("s-]"  . corral-brackets-forward)
   ("s-{"  . corral-braces-backward)
   ("s-}"  . corral-braces-forward)
   ("s-("  . corral-parentheses-backward)
   ("s-)"  . corral-parentheses-forward)
   ("s-\"" . corral-double-quotes-backward)
   ("s-'"  . corral-double-quotes-forward)))
