;;; c-config.el --- C/C++ development setup

;;; Code completion via LSP + company
(use-package lsp-mode
  :ensure t
  :hook ((c-mode . lsp-deferred)
         (c++-mode . lsp-deferred))
  :commands lsp-deferred
  :custom
  (lsp-clients-clangd-args '("--clang-tidy" "--header-insertion=iwyu"))
  (lsp-completion-provider :capf)
  (lsp-idle-delay 0.3))

(use-package lsp-ui
  :ensure t
  :hook (lsp-mode . lsp-ui-mode)
  :custom
  (lsp-ui-doc-enable t)
  (lsp-ui-sideline-enable t))

(use-package company
  :ensure t
  :hook (lsp-mode . company-mode)
  :custom
  (company-minimum-prefix-length 1)
  (company-idle-delay 0.2))

;;; Compile with a single key + jump to errors
(defun ajw/compile-c ()
  "Run compile for C/C++ projects."
  (interactive)
  (let* ((makefile-dir (locate-dominating-file default-directory "Makefile"))
         (out (file-name-sans-extension buffer-file-name)))
    (if makefile-dir
        (let ((default-directory makefile-dir))
          (compile "make -k"))
      (compile (format "gcc -Wall -g -o %s %s" out buffer-file-name)))))

(defun ajw/run-c ()
  "Run the compiled binary for the current file, output in a new buffer."
  (interactive)
  (let* ((makefile-dir (locate-dominating-file default-directory "Makefile"))
         (binary (if makefile-dir
                     (expand-file-name
                      (file-name-sans-extension (buffer-name))
                      makefile-dir)
                   (file-name-sans-extension buffer-file-name))))
    (if (file-executable-p binary)
        (with-current-buffer (get-buffer-create "*C Run Output*")
          (erase-buffer)
          (pop-to-buffer (current-buffer))
          (call-process binary nil t t))
      (message "Binary not found: %s — compile first with F5" binary))))

(with-eval-after-load 'cc-mode
  (define-key c-mode-map   (kbd "<f5>") #'ajw/compile-c)
  (define-key c++-mode-map (kbd "<f5>") #'ajw/compile-c)
  (define-key c-mode-map   (kbd "<f7>") #'ajw/run-c)
  (define-key c++-mode-map (kbd "<f7>") #'ajw/run-c)
  (global-set-key (kbd "<f6>")   #'next-error)
  (global-set-key (kbd "<S-f6>") #'previous-error))

;;; Project tree
(use-package treemacs
  :ensure t
  :bind (("<f8>" . treemacs)))

(use-package treemacs-projectile
  :ensure t
  :after (treemacs projectile))

;;; Nice C style
(setq-default c-basic-offset 4
              c-default-style "linux")

(provide 'c-config)
;;; c-config.el ends here
