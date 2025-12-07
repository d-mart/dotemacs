;(use-package copilot
;  :defer t
;  :hook (prog-mode . copilot-mode)
;  :config
;  ;; Bind on the minor-mode map (active when copilot-mode is on)
;  (when-let ((map (bound-and-true-p copilot-mode-map)))
;    (define-key map (kbd "C-c C-a") #'copilot-accept-completion)
;    (define-key map (kbd "M-]")     #'copilot-next-completion)
;    (define-key map (kbd "M-[")     #'copilot-previous-completion)
;    (define-key map (kbd "C-c C-k") #'copilot-clear-overlay))
;  ;; Bind on the completion map (active while a suggestion is shown)
;  (when-let ((map (bound-and-true-p copilot-completion-map)))
;    (define-key map (kbd "<tab>")   #'copilot-accept-completion)
;    (define-key map (kbd "C-<tab>") #'copilot-accept-completion-by-word)
;    (define-key map (kbd "M-<tab>") #'copilot-accept-completion-by-line)))

;(use-package copilot-chat
;    :defer t
;    :after copilot
;    :config
;    (setq copilot-chat-model "gpt-5-codex")
;  )


(defun dm/copilot-post-install ()
  "Run post-install commands after installing the copilot package for Emacs."
  (interactive)
  ;; Refresh package contents if not already done
  (unless package-archive-contents
    (package-refresh-contents))
  ;; Install copilot if missing
  (unless (package-installed-p 'copilot)
    (package-install 'copilot))
  ;; Add copilot to load-path and require it
  (add-to-list 'load-path (expand-file-name "copilot" user-emacs-directory))
  (require 'copilot)

  ;; https://github.com/copilot-emacs/copilot.el
  ;; install the copilot language server, a required intermediary
  (copilot-install-server) ;; requires node >= 22
  ;; log into github/copilot
  (copilot-login)

  (when (featurep 'copilot)
    (define-key copilot-mode-map (kbd "C-<tab>") #'copilot-accept-completion)
    (define-key copilot-mode-map (kbd "M-]")   #'copilot-next-completion)
    (define-key copilot-mode-map (kbd "M-[")   #'copilot-previous-completion))
  (message "Copilot post-install commands completed."))

;; Usage:
;; M-x dm/copilot-post-install

(use-package chatgpt-shell
  :defer t
  :config
  ()
  )

;(use-package gptel
;  :defer t
;  :config
;  (setq gptel-api-key))

;; OpenRouter offers an OpenAI compatible API
;(gptel-make-openai "OpenRouter"               ;Any name you want
;  :host "openrouter.ai"
;  :endpoint "/api/v1/chat/completions"
;  :stream t
;  :key "your-api-key"                   ;can be a function that returns the key
;  :models '(openai/gpt-3.5-turbo
;            mistralai/mixtral-8x7b-instruct
;            meta-llama/codellama-34b-instruct
;            codellama/codellama-70b-instruct
;            google/palm-2-codechat-bison-32k
;            google/gemini-pro))

;(gptel-make-gh-copilot "Copilot")
;;; OPTIONAL configuration
;(setq gptel-model 'claude-4.5-sonnet
;      gptel-backend (gptel-make-gh-copilot "Copilot"))
