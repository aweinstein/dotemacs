;;; init.el --- AJW's init file
;;; Commentary:
;;; My Emacs init file

;;; Code:
(message "* --[ Loading AJW Emacs init file ]--")

;; Based on https://cestlaz.github.io/posts/using-emacs-1-setup/
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
'("melpa" . "https://melpa.org/packages/"))

(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
(package-refresh-contents)
(package-install 'use-package))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; The remaining of the config is separeted in files
(add-to-list 'load-path "~/.emacs.d/lisp")
(load-library "basic-config")
(load-library "latex-config")
(when (not (eq system-type 'windows-nt))
  ;; Your non-Windows-specific code here
  (load-library "server-start-config"))
(load-library "tramp-config")
(load-library "color-theme-config")
(load-library "dired-config")
(load-library "shell-config")
(load-library "eshell-config")
(load-library "funcdefs")
(load-library "assorted")
(load-library "org-config")
(load-library "lsp-config")
(load-library "python-config")
(load-library "c-config")

(when (eq system-type 'windows-nt)
  ;; Your Windows-specific code here
  (load-library "windows")
  (message "Running on Windows"))

(message "* --[ Done with AJW Emacs init file ]--")
