; Use zenburn colortheme: https://github.com/bbatsov/zenburn-emacs
; $ git clone https://github.com/bbatsov/zenburn-emacs ~/.emacs.d/themes/

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'zenburn t)

;For ReST mode with dark background
(setq frame-background-mode 'dark)
