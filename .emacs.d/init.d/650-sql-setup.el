;;
;; sql-setup.el
;;
;; Configuration for sql (mysql, maria, postgres) interaction
;;

(require 'sql)

; Add port to the parameters required for mysql connection
(setq sql-mysql-login-params    (append sql-mysql-login-params    '(port :default 3306)))
(setq sql-postgres-login-params (append sql-postgres-login-params '(port :default 5432)))

(setq sql-port 3307)
