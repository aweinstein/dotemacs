;; From https://github.com/rememberYou/.emacs.d/blob/master/config.org#lsp

(use-package lsp-mode
  :ensure t
  :commands (lsp lsp-deferred)
  :hook (
	 ;; (prog-mode . lsp-deferred)
         (lsp-mode . lsp-enable-which-key-integration))
  :custom
  (lsp-enable-folding nil)
  (lsp-enable-links nil)
  (lsp-enable-snippet nil)
  (lsp-keymap-prefix "C-c ;")
  ;; (lsp-session-file (expand-file-name (format "%s/emacs/lsp-session-v1"  xdg-data)))
  (read-process-output-max (* 1024 1024)))

(use-package lsp-ui
  :ensure t
  :hook (lsp-mode . lsp-ui-mode))

;; When using lsp, it is likely that you will encounter programming errors. To navigate through these errors via the minibuffer, you can use a package for that. If like me, you use consult with your minibuffer completion, then consult-lsp is made for you.

(use-package consult-lsp
  :ensure t
  :commands (consult-lsp-diagnostics consult-lsp-symbols))
