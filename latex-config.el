; Latex setup
(require 'reftex)
(setq-default TeX-master nil)
(add-hook 'LaTeX-mode-hook 'TeX-PDF-mode) ;turn on pdf-mode.  AUCTeX
					;will call pdflatex to
					;compile instead of latex.
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode) ;turn on math-mode by
					;default
(add-hook 'LaTeX-mode-hook 'reftex-mode) ;turn on REFTeX mode by
					;default
(add-hook 'LaTeX-mode-hook 'flyspell-mode) ;turn on flyspell mode by
					;default

(setq reftex-plug-into-AUCTeX t)
(setq TeX-auto-save t)
(setq TeX-save-query nil)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)



