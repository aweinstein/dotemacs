;; http://astrofrog.github.com/astropy/development/codeguide_emacs.html
;; Automatically remove trailing whitespace when file is saved.
(add-hook 'java-mode-hook
          (lambda()
            (add-hook 'local-write-file-hooks
                      '(lambda()
                         (save-excursion
                           (delete-trailing-whitespace))))))
