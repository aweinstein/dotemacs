; Setup ELPA packaging system

(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives 
	       '("melpa" . "http://melpa.milkbox.net/packages/") 
	       t)
  (add-to-list 'package-archives
	       '("elpy" . "http://jorgenschaefer.github.io/packages/")
	       )
  )
