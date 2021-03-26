;; http://astrofrog.github.com/astropy/development/codeguide_emacs.html
;; Automatically remove trailing whitespace when file is saved.
(add-hook 'python-mode-hook
          (lambda()
            (add-hook 'local-write-file-hooks
                      '(lambda()
                         (save-excursion
                           (delete-trailing-whitespace))))))
;; Elpy
;; See http://elpy.readthedocs.org/en/latest/index.html
;; Install using MELPA !!!

;; (use-package elpy
;;   :ensure t
;;   :init
;;   (elpy-enable))

;; (require 'package)
;; (add-to-list 'package-archives
;;              '("melpa-stable" . "https://stable.melpa.org/packages/"))
;; (package-initialize)

(use-package elpy
  :ensure t
  :init
  (elpy-enable)
  (setq elpy-rpc-python-command "/home/ajw/.local/anaconda/bin/python")
  (setq python-shell-interpreter "/home/ajw/.local/anaconda/bin/ipython"
	python-shell-interpreter-args "-i --simple-prompt")

  (setq elpy-rpc-virtualenv-path "/home/ajw/.local/anaconda/bin/")
)
