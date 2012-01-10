; org-mode
(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(add-hook 'org-mode-hook 'turn-on-auto-fill)
;    To save the clock history across Emacs sessions, use 
(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)

; Latex configuration
; See http://orgmode.org/worg/org-tutorials/org-latex-export.html
(require 'org-latex)
(unless (boundp 'org-export-latex-classes)
  (setq org-export-latex-classes nil))
(add-to-list 'org-export-latex-classes
	     '("article"
                "\\documentclass[10pt,letterpaper]{article}
		\\usepackage[T1]{fontenc}
		\\usepackage{graphicx}
		\\usepackage{geometry}
		\\geometry{left=1.5in, right=2in, top=2.5cm,bottom=4 cm}
		\\pagestyle{empty}"

                ("\\section{%s}" . "\\section*{%s}")))

