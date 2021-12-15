;; For python, system install python-lsp-server (e.g.
;; conda install python-lsp-server
;; Based on:
;; https://www.mortens.dev/blog/emacs-and-the-language-server-protocol/

;; (use-package lsp-mode
;;   :ensure t
;;   :config
;;   (add-hook 'c++-mode-hook #'lsp)
;;   (add-hook 'python-mode-hook #'lsp)
;;   ;; (add-hook 'rust-mode-hook #'lsp)
;;   (setq lsp-clients-clangd-args '("-j=2" "-background-index" "-log=error"))
;;   )


;; From https://github.com/rememberYou/.emacs.d/blob/master/config.org#lsp

(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :hook ((prog-mode . lsp-deferred)
         (lsp-mode . lsp-enable-which-key-integration))
  :custom
  (lsp-enable-folding nil)
  (lsp-enable-links nil)
  (lsp-enable-snippet nil)
  (lsp-keymap-prefix "C-c ;")
  ;; (lsp-session-file (expand-file-name (format "%s/emacs/lsp-session-v1"  xdg-data)))
  (read-process-output-max (* 1024 1024)))

;; (use-package lsp-ui
;;   :hook (lsp-mode . lsp-ui-mode))

;; When using lsp, it is likely that you will encounter programming errors. To navigate through these errors via the minibuffer, you can use a package for that. If like me, you use consult with your minibuffer completion, then consult-lsp is made for you.

;; (use-package consult-lsp
;;   :commands (consult-lsp-diagnostics consult-lsp-symbols))
