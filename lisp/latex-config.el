; Latex setup
(require 'reftex)
;(setq-default TeX-master nil)
(add-hook 'LaTeX-mode-hook 'TeX-PDF-mode) ;Turn on pdf-mode.
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode) ;turn on math-mode by default
(add-hook 'LaTeX-mode-hook 'reftex-mode) ;turn on REFTeX mode by default
(add-hook 'LaTeX-mode-hook 'flyspell-mode) ;turn on flyspell mode by default
(setq TeX-save-query nil) ;autosave before compiling
;(add-hook 'LaTeX-mode-hook 'turn-on-auto-fill)
(add-hook 'LaTeX-mode-hook 'visual-line-mode)


(setq TeX-parse-self t)
(setq reftex-ref-macro-prompt nil)

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

;; (add-hook 'LaTeX-mode-hook 'turn-on-reftex)
;; (setq-default TeX-master nil)
;; ;(add-hook 'LaTeX-mode-hook 'visual-line-mode)

;; Automatically remove trailing whitespace when file is saved.
(add-hook 'LaTeX-mode-hook
          (lambda()
            (add-hook 'local-write-file-hooks
                      '(lambda()
                         (save-excursion
                           (delete-trailing-whitespace))))))

; Increase size of equation previews
(set-default 'preview-scale-function 1.2)
