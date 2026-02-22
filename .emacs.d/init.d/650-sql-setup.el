;; -*- lexical-binding: nil; -*-
;;
;; sql-setup.el
;;
;; Configuration for sql (mysql, maria, postgres) interaction
;;

;postgres://user:pass@ehost:5432/database
(defun split-sql-url (url)
  "connect to a database after entering a URL"
  (interactive "sDatabase URL: ")
  (setq first-split  (split-string url "://"))
  (setq protocol     (car first-split))
  ;(setq at-split     (string-utils-split first-split "@"))
  ;(setq username     (car (split-string at-split ":")))
  ;(setq password     (cdr (split-string at-split ":")))
  ;(setq host-port-db (cdr at-split))
  ;(setq host)

  '((:dbms protocol) (:username . username) (:password . password)
   ))


(setq sql-connection-alist
  '((db (sql-product 'postgres)
        (sql-database (concat "postgresql://user:"
                       (my-pass "db/user")
                        "@host/database")))))

(require 'sql)

; Add port to the parameters required for mysql connection
(setq sql-mysql-login-params    (append sql-mysql-login-params    '(port :default 3306)))
(setq sql-postgres-login-params (append sql-postgres-login-params '(port :default 5432)))

(setq sql-port 3307)
