(message "* --[ Loading AJW Emacs init file ]--")

(add-to-list 'load-path "~/.emacs.d/lisp")

(load-library "package-config")
(load-library "basic-config")
(load-library "latex-config")
(load-library "server-start-config")
(load-library "ido-mode-config")
(load-library "tramp-config")
(load-library "color-theme-config")
(load-library "dired-config")
(load-library "shell-config")
(load-library "eshell-config")
(load-library "funcdefs")
(load-library "assorted")
(load-library "org-config")
(load-library "python-config")
(load-library "keybindings") ; keept it at the end


;(load-library "java-config")
;(load-library "ecb-config")
;(load-library "cedet-config")
;(load-library "malabar-config")
;(require 'pomodoro)

(message "* --[ Done with AJW Emacs init file ]--")
