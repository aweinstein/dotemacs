;; For python, system install python-lsp-server (e.g.
;; conda install python-lsp-server
;; Based on:
;; https://www.mortens.dev/blog/emacs-and-the-language-server-protocol/

(use-package lsp-mode
  :ensure t
  :config
  (add-hook 'c++-mode-hook #'lsp)
  (add-hook 'python-mode-hook #'lsp)
  ;; (add-hook 'rust-mode-hook #'lsp)
  (setq lsp-clients-clangd-args '("-j=2" "-background-index" "-log=error"))
  )
