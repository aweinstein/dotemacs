(message "* --[ Loading AJW Emacs init file ]--")

(add-to-list 'load-path "~/.emacs.d")

(load-library "basic-config")
(load-library "latex-config")
(load-library "org-config")
(load-library "server-start-config")
(load-library "ido-mode-config")
(load-library "tramp-config")
(load-library "color-theme-config")
(load-library "python-config")
(load-library "cedet-config")
(load-library "ecb-config")
(load-library "malabar-config")

(message "* --[ Done with AJW Emacs init file ]--")
