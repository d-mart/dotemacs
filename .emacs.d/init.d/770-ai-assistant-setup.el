;; -*- lexical-binding: nil; -*-

;; When copilot loads, immediately check whether the language server is
;; present.  If not, override copilot-mode with a no-op so that nothing
;; (hooks, timers, other packages) can accidentally activate it.
(with-eval-after-load 'copilot
  (if (condition-case nil (copilot-server-executable) (error nil))
      ;; Server found: wire up prog-mode and keybindings normally.
      (progn
        (add-hook 'prog-mode-hook #'copilot-mode)
        (define-key copilot-mode-map (kbd "C-c C-a") #'copilot-accept-completion)
        (define-key copilot-mode-map (kbd "M-]")     #'copilot-next-completion)
        (define-key copilot-mode-map (kbd "M-[")     #'copilot-previous-completion)
        (define-key copilot-mode-map (kbd "C-c C-k") #'copilot-clear-overlay)
        (define-key copilot-completion-map (kbd "<tab>")   #'copilot-accept-completion)
        (define-key copilot-completion-map (kbd "C-<tab>") #'copilot-accept-completion-by-word)
        (define-key copilot-completion-map (kbd "M-<tab>") #'copilot-accept-completion-by-line))
    ;; No server: replace copilot-mode with a no-op so nothing can enable it.
    (advice-add 'copilot-mode :override
                (lambda (&rest _)
                  (when (called-interactively-p 'any)
                    (message "Copilot: server not installed. Run M-x dm/copilot-post-install."))))))

(with-eval-after-load 'copilot-chat
  (setq copilot-chat-model "gpt-5-codex"))


(defun dm/copilot-post-install ()
  "Run post-install commands after installing the copilot package for Emacs."
  (interactive)
  (unless package-archive-contents
    (package-refresh-contents))
  (unless (package-installed-p 'copilot)
    (package-install 'copilot))
  (add-to-list 'load-path (expand-file-name "copilot" user-emacs-directory))
  (require 'copilot)
  ;; https://github.com/copilot-emacs/copilot.el
  (copilot-install-server) ;; requires node >= 22
  (copilot-login)
  (when (featurep 'copilot)
    (define-key copilot-mode-map (kbd "C-<tab>") #'copilot-accept-completion)
    (define-key copilot-mode-map (kbd "M-]")   #'copilot-next-completion)
    (define-key copilot-mode-map (kbd "M-[")   #'copilot-previous-completion))
  (message "Copilot post-install commands completed."))
;; Usage: M-x dm/copilot-post-install

(use-package chatgpt-shell
  :defer t
  :config
  ())

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
