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
(load-library "dired-config")
(load-library "shell-config")
(load-library "eshell-config")
(load-library "funcdefs")
(load-library "assorted")
(load-library "org-config")
;; (load-library "lsp-config")
;; (load-library "python-config")
(load-library "c-config")

(when (eq system-type 'windows-nt)
  ;; Your Windows-specific code here
  (load-library "windows")
  (message "Running on Windows"))

;;;;;;;; For improving scrolling performance
;; GC
(setq gc-cons-threshold (* 100 1024 1024))
(setq gc-cons-percentage 0.1)
(setq inhibit-compacting-font-caches t)
;; Redisplay
(setq redisplay-skip-fontification-on-input t)  ; Emacs 29+
(setq jit-lock-defer-time 0.1)
(setq jit-lock-stealth-time 2.0)
;; which-key
(setq which-key-idle-delay 1.0)
;; flyspell — only check when idle, not on every command
(setq flyspell-issue-message-flag nil)

(use-package flyspell-lazy
  :ensure t
  :after flyspell
  :config
  (flyspell-lazy-mode 1)
  (setq flyspell-lazy-idle-seconds 1.5)    ; check after 1.5s of inactivity
  (setq flyspell-lazy-window-idle-seconds 3.0)) ; full window scan after 3s

(message "* --[ Done with AJW Emacs init file ]--")
