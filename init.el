(message "* --[ Loading AJW Emacs init file ]--")

;; Basic configuration
(setq inhibit-startup-message t) ; suppress initial startup message
(tool-bar-mode -1) ; hide the toolbar
(set-scroll-bar-mode 'right) 

(setq make-backup-files nil) ; Disable creation of backup files

;Copy paste between applications
(setq x-select-enable-clipboard t) ; as above
(setq interprogram-paste-function 'x-cut-buffer-or-selection-value)

; Start the server
(server-start)

; Enable Delete Selection mode to replace a region just by typing text, and
; kill the selected text just by hitting the Backspace key.
(delete-selection-mode 1)

(add-to-list 'load-path "~/.emacs.d/")


; Use zenburn colortheme: https://github.com/bbatsov/zenburn-emacs
(add-to-list 'load-path "~/.emacs.d/zenburn-emacs")
(require 'color-theme-zenburn)
(color-theme-zenburn)

(message "* --[ Done with AJW Emacs init file ]--")
