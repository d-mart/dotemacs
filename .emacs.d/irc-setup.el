;;;
;;; My setup for IRC (the accounts here are tunnelled to a ZNC bouncer and passwords are replaced)
;;; 


;; znc (basically just erc)


;; rcirc
(setq rcirc-authinfo '(("" nickserv "" "")))
(setq rcirc-fill-column 'frame-width)
(setq rcirc-prompt "%n@%t> ")
(setq rcirc-server-alist '(("localhost" :nick "dmartinez"  :port 6667 :user-name "dmartinez"  :password "ircp4$$" :encryption tls nil nil)
			   ("localhost" :nick "dmartinez2" :port 6667 :user-name "dmartinez2" :password "ircp4$$" :encryption tls nil nil)))
