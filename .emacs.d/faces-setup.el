(defface font-lock-punctuation-face
  '((((background dark)) (:foreground "MediumOrchid1"))
    (t (:foreground "MediumOrchid3")))
  "*Mah face."
  :group 'faces)

;; add punctuation colorization
(font-lock-add-keywords 'ruby-mode
    '(("\\([][()~^&\\|<>=,.\\+*/%-]\\)" 0 'font-lock-punctuation-face)))

;; numbers hiliting
(font-lock-add-keywords 'ruby-mode
    '(("\\<[\\+-]?[0-9]+\\(.[0-9A-Fa-f]+\\)?\\>" 0 'font-lock-digit-face)))

;; remove font-lock-keywords
(font-lock-remove-keywords 'ruby-mode
    '(("\\([][()~^&\\|<>=,.\\+*/%-]\\)" 0 'font-lock-punctuation-face)))

;; add double-color
(font-lock-add-keywords 'ruby-mode
    '(("::" 0 'font-lock-punctuation-face)))
