(setq org-load-defer-seconds 10)

(use-package org-mode
  :defer org-load-defer-seconds
  :init
  ()
  :bind
  ())

(use-package org-bullets
  :defer org-load-defer-seconds
  :init
  ((setq org-bullets-bullet-list '("✺" "✹" "✸" "✷" "✶" "✭" "✦" "■" "▲" "●" ))))
