(add-to-list 'load-path "~/.emacs.d/malabar-mode/lisp")

;; See https://github.com/buzztaiki/malabar-mode
(require 'cedet)
(semantic-load-enable-minimum-features) ;; or enable more if you wish
(require 'malabar-mode)
(setq malabar-groovy-lib-dir "~/.emacs.d/malabar-mode/lib")
(add-to-list 'auto-mode-alist '("\\.java\\'" . malabar-mode))
