;; Basic configuration
(setq inhibit-startup-message t) ; suppress initial startup message
(tool-bar-mode -1) ; hide the toolbar

; Scrolling
(set-scroll-bar-mode 'right) 
(setq
  scroll-margin 0                  
  scroll-conservatively 100000
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

; Set font size to 8 pts
(set-face-attribute 'default nil :height 80)

; Set column width to 79 characters
(setq-default fill-column 79)
(add-hook 'text-mode-hook 'auto-fill-mode)

; Update files modified externally
; See http://www.emacswiki.org/emacs/RevertBuffer
(global-auto-revert-mode t)

; ----------------------------------------
; http://www.emacswiki.org/cgi-bin/wiki/EmacsNiftyTricks#toc3
;; (defadvice save-buffers-kill-emacs (around no-query-kill-emacs activate)
;;   "Prevent annoying \"Active processes exist\" query when you quit Emacs."
;;   (flet ((process-list ())) ad-do-it))

(fset 'yes-or-no-p 'y-or-n-p)
