(use-package plantuml-mode
  :init
  (setq plantuml-default-exec-mode 'jar) ; or 'server if you want diagrams sent out
  (setq plantuml-jar-path "/usr/local/Cellar/plantuml/1.2021.10/libexec/plantuml.jar")
  (setq plantuml-indent-level 2)
  )
