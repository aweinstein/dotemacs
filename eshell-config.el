; Based on http://www.emacswiki.org/emacs/EshellFunctions#toc7
(setq eshell-prompt-function
      (lambda ()
        (concat (getenv "USER") "@"
		(system-name) 
		(if (= (user-uid) 0) " # " "$ ")
	 )))

(setq eshell-prompt-regexp "^[^#$]*[#$] ")
