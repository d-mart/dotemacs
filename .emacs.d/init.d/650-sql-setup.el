;;
;; sql-setup.el
;;
;; Configuration for sql (mysql, maria, postgres) interaction
;;


; XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXx

(setq sql-connection-alist
      '((server1 (sql-product 'postgres)
                  (sql-port 5432)
                  (sql-server "ec2-54-225-205-79.compute-1.amazonaws.com")
                  (sql-user "kfisoebiihceln")
                  (sql-password "d32db90cd39db97343b746f2f0daabcd8e8ece1a9fa9f1022692af3763d90e95")
                  (sql-database "debt49hl6a5bh2"))
        (server2 (sql-product 'postgres)
                  (sql-port 5432)
                  (sql-server "localhost")
                  (sql-user "user")
                  (sql-password "password")
                  (sql-database "db2"))))

(defun my-sql-server1 ()
  (interactive)
  (my-sql-connect 'postgres 'server1))

(defun my-sql-server2 ()
  (interactive)
  (my-sql-connect 'postgres 'server2))

(defun my-sql-connect (product connection)
  ;; remember to set the sql-product, otherwise, it will fail for the first time
  ;; you call the function
  (setq sql-product product)
  (sql-connect connection))
; XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXx

;postgres://kfisoebiihceln:d32db90cd39db97343b746f2f0daabcd8e8ece1a9fa9f1022692af3763d90e95@ec2-54-225-205-79.compute-1.amazonaws.com:5432/debt49hl6a5bh2
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
