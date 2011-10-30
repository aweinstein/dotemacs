;; Basic configuration
(setq inhibit-startup-message t) ; suppress initial startup message
(tool-bar-mode -1) ; hide the toolbar
(set-scroll-bar-mode 'right) 

(setq make-backup-files nil) ; Disable creation of backup files

;Copy paste between applications
(setq x-select-enable-clipboard t) ; as above
(setq interprogram-paste-function 'x-cut-buffer-or-selection-value)


; Enable Delete Selection mode to replace a region just by typing text, and
; kill the selected text just by hitting the Backspace key.
(delete-selection-mode 1)
