(autoload 'protobuf-mode "protobuf-mode"
          "Google Protocol Buffers syntax hilighting" t)

(add-hook 'protobuf-mode-hook 'my-programming-mode-hook)

(add-to-list 'auto-mode-alist '("\\.proto$" . protobuf-mode))
