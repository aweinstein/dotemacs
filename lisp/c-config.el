(defun my-c-mode-hook ()
  (setq c-basic-offset 4)      ;; indentation width
  (setq indent-tabs-mode nil)) ;; use spaces instead of tabs

(add-hook 'c-mode-common-hook 'my-c-mode-hook)
