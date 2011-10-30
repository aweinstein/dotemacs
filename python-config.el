;; Python mode
(add-to-list 'load-path "~/.emacs.d/python-mode")
(setq auto-mode-alist (cons '("\\.py$" . python-mode) auto-mode-alist))
(setq interpreter-mode-alist (cons '("python" . python-mode)
 				   interpreter-mode-alist))
(autoload 'python-mode "python-mode" "Python editing mode." t)
(setq py-install-directory "~/.emacs.d/python-mode")
