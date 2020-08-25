; Setup ELPA packaging system
; Don't forget to run package-refresh-content

(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives 
	       '("melpa" . "http://melpa.org/packages/")
	       t)
  (add-to-list 'package-archives
	       '("elpy" . "http://jorgenschaefer.github.io/packages/")
	       )
  (add-to-list 'package-archives
  	       '("gnu" . "http://elpa.gnu.org/packages/")
  	       )
  )
