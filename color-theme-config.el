; Use zenburn colortheme: https://github.com/bbatsov/zenburn-emacs

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'zenburn t)
;(add-to-list 'load-path "~/.emacs.d/themes")
;(require 'color-theme-zenburn)
;(color-theme-zenburn)

; For ReST mode with dark background
(setq frame-background-mode 'dark)
