; Based on http://www.emacswiki.org/emacs/EshellFunctions#toc7
(setq eshell-prompt-function
      (lambda ()
        (concat (getenv "USER") "@"
		(getenv "HOSTNAME") 
		(if (= (user-uid) 0) " # " "$ ")
	 )))

(setq eshell-prompt-regexp "^[^#$]*[#$] ")

; Based on http://dryice.name/blog/emacs/eshell/
(setq eshell-cmpl-cycle-completions nil)
;; scroll to the bottom
(setq eshell-scroll-to-bottom-on-output t)
(setq eshell-scroll-show-maximum-output t)

