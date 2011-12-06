; Latex setup
 (require 'reftex)
 (setq-default TeX-master nil)
 (add-hook 'LaTeX-mode-hook 'TeX-PDF-mode) ;turn on pdf-mode. AUCTeX will call
					   ;pdflatex to compile instead of
					   ;latex.
 (add-hook 'LaTeX-mode-hook 'LaTeX-math-mode) ;turn on math-mode by default
 (add-hook 'LaTeX-mode-hook 'reftex-mode) ;turn on REFTeX mode by default
 (add-hook 'LaTeX-mode-hook 'flyspell-mode) ;turn on flyspell mode by default

; use evince for dvi and pdf viewer
; evince-dvi backend should be installed
 (setq TeX-view-program-selection
       '((output-dvi "DVI Viewer")
 	(output-pdf "PDF Viewer")
 	(output-html "Google Chrome")))
 (setq TeX-view-program-list
       '(("DVI Viewer" "evince %o")
 	("PDF Viewer" "evince %o")
 	("Google Chrome" "google-chrome %o")))

 (setq TeX-output-view-style
       (quote
        (("^pdf$" "." "evince -f %o")
         ("^html?$" "." "iceweasel %o"))))

;; (setq reftex-plug-into-AUCTeX t)
;; (setq TeX-auto-save t)
;; (setq TeX-save-query nil)
;; (setq TeX-parse-self t)
;; (setq-default TeX-master nil)
;; (add-hook 'LaTeX-mode-hook 'turn-on-reftex)



;; (setq TeX-auto-save t)
;; (setq TeX-parse-self t)
;; (setq-default TeX-master nil)
;; ;(add-hook 'LaTeX-mode-hook 'visual-line-mode)
;; (add-hook 'LaTeX-mode-hook 'auto-fill-mode)
;; (add-hook 'LaTeX-mode-hook 'flyspell-mode)
;; (add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
;; (add-hook 'LaTeX-mode-hook 'turn-on-reftex)
;; (setq reftex-plug-into-AUCTeX t)


