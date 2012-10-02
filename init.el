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
(load-library "java-config")
(load-library "ecb-config")

;(load-library "cedet-config")

;(load-library "malabar-config")
;(require 'pomodoro)

(message "* --[ Done with AJW Emacs init file ]--")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(safe-local-variable-values (quote ((Local . castellano)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
