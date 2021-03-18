;; Basic configuration
(setq inhibit-startup-message t) ; suppress initial startup message
(tool-bar-mode -1) ; hide the toolbar

; Scrolling
(set-scroll-bar-mode 'right) 
(setq
  scroll-margin 0                  
  ;scroll-conservatively 100000
  scroll-preserve-screen-position 1)

(setq make-backup-files nil) ; Disable creation of backup files

;Copy paste between applications
(setq x-select-enable-clipboard t) ; as above
(setq interprogram-paste-function 'x-cut-buffer-or-selection-value)


; Enable Delete Selection mode to replace a region just by typing text, and
; kill the selected text just by hitting the Backspace key.
(delete-selection-mode 1)

; Enable column numbering
(column-number-mode 1)

; Enable show parenthesis mode
(show-paren-mode 1)

; Set column width to 79 characters
(setq-default fill-column 79)

; Update files modified externally
; See http://www.emacswiki.org/emacs/RevertBuffer
(global-auto-revert-mode t)

; ----------------------------------------
; http://www.emacswiki.org/cgi-bin/wiki/EmacsNiftyTricks#toc3
;; (defadvice save-buffers-kill-emacs (around no-query-kill-emacs activate)
;;   "Prevent annoying \"Active processes exist\" query when you quit Emacs."
;;   (flet ((process-list ())) ad-do-it))

(fset 'yes-or-no-p 'y-or-n-p)

; Set google-chrome as default browser
; Should we use w3m?
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "google-chrome")

; Save customization configuration in a file differente than init.el

(setq custom-file "~/.emacs.d/lisp/.emacs-custom.el")
;(load custom-file)

(when (memq window-system '(x mac ns))
  (exec-path-from-shell-initialize))

; Enable spell check on text mode
(add-hook 'text-mode-hook 'flyspell-mode) ;turn on flyspell mode by default
(add-hook 'text-mode-hook 'turn-on-flyspell)
(add-hook 'text-mode-hook 'visual-line-mode)

; Enable pdf-tools
;(pdf-tools-install)

(defalias 'list-buffers 'ibuffer)

;; Always use english for dates
(setq system-time-locale "C") 

;; Yasnippet
(yas-global-mode 1)


;;;;;;;;;;;;;;;;;;; Key Bindings
;; Magit
(global-set-key (kbd "C-x g") 'magit-status)
;; org-mode
(global-set-key (kbd "<f12>") 'org-capture)
;; Since M-Tab is used by the OS, we remap it here
(global-set-key (kbd "C-x t") 'pcomplete)
