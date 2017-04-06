; In dired mode, Enter and ^ use the same buffer
(put 'dired-find-alternate-file 'disabled nil)
(add-hook 'dired-mode-hook
  (lambda()
    (define-key dired-mode-map (kbd "<return>")
      'dired-find-alternate-file)
    (define-key dired-mode-map (kbd "^")
      (lambda () (interactive) (find-alternate-file "..")))
  ))

; Enable dired-x
; http://www.gnu.org/software/emacs/manual/html_node/dired-x/Installation.html#Installation

(autoload 'dired-jump "dired-x"
  "Jump to Dired buffer corresponding to current buffer." t)
     
(autoload 'dired-jump-other-window "dired-x"
  "Like \\[dired-jump] (dired-jump) but in other window." t)
     
(define-key global-map "\C-x\C-j" 'dired-jump)
(define-key global-map "\C-x4\C-j" 'dired-jump-other-window)

(add-hook 'dired-load-hook
	  (lambda ()
	    (load "dired-x")
	    ;; Set dired-x global variables here.  For example:
	    ;; (setq dired-guess-shell-gnutar "gtar")
	    ;; (setq dired-x-hands-off-my-keys nil)
	    ))

(add-hook 'dired-mode-hook
	  (lambda ()
	    ;; Set dired-x buffer-local variables here.  For example:
	    ;; (dired-omit-mode 1)
	    ))
