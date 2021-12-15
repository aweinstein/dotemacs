;; http://astrofrog.github.com/astropy/development/codeguide_emacs.html
;; Automatically remove trailing whitespace when file is saved.
(add-hook 'python-mode-hook
          (lambda()
            (add-hook 'local-write-file-hooks
                      '(lambda()
                         (save-excursion
                           (delete-trailing-whitespace))))))

;; Need to
;; pip install pyright
;; at the system level
;; From https://github.com/rememberYou/.emacs.d/blob/master/config.org#python
(use-package python
  :ensure flycheck
  :delight "π"
  :preface
  (defun python-remove-unused-imports()
    "Remove unused imports and unused variables with autoflake."
    (interactive)
    (if (executable-find "autoflake")
        (progn
          (shell-command (format "autoflake --remove-all-unused-imports -i %s"
                                 (shell-quote-argument (buffer-file-name))))
          (revert-buffer t t t))
      (warn "[✗] python-mode: Cannot find autoflake executable.")))
  :bind (:map python-mode-map
              ("M-[" . python-nav-backward-block)
              ("M-]" . python-nav-forward-block)
              ("M-|" . python-remove-unused-imports))
  :custom
  (flycheck-pylintrc "~/.pylintrc")
  (flycheck-python-pylint-executable "/usr/bin/pylint")
  )

(use-package lsp-pyright
  :ensure t
  :hook (python-mode . (lambda ()
                          (require 'lsp-pyright)
                          (lsp))))  ; or lsp-deferred

(use-package pyvenv
  :after python
  ;; :custom
  ;; (pyvenv-default-virtual-env-name (expand-file-name (format "%s/myenv/" xdg-data)))
  ;; (pyvenv-workon (expand-file-name (format "%s/myenv/" xdg-data)))
  :config (pyvenv-tracking-mode))

(message "* --[ Done with AJW python configuration ]--")
