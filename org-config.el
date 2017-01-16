;; flyspell mode for spell checking everywhere
(add-hook 'org-mode-hook 'turn-on-flyspell 'append)

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(add-hook 'org-mode-hook 'turn-on-auto-fill)
;    To save the clock history across Emacs sessions, use 
(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)

; Set the agenda files
(setq org-agenda-files (list "~/Dropbox/org/ID16I10322.org" 
			     "~/Dropbox/org/ac3e.org"
			     "~/Dropbox/org/otros.org"
			     "~/Dropbox/org/tre.org"
			     "~/Dropbox/org/MCIB.org"
			     "~/Dropbox/org/admin.org"
			     ))

(require 'org-latex)
(unless (boundp 'org-export-latex-classes)
  (setq org-export-latex-classes nil))
(add-to-list 'org-export-latex-classes
             '("article"
               "\\documentclass{article}"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

;; to fix problems with amsmath conflicting with wasysym:
;;
;; From: Lawrence Mitchell <wence <at> gmx.li>
;; Subject: [Orgmode] Re: [bug] latex export ignores org-export-latex-default-packages-alist?
;; To: emacs-orgmode <at> gnu.org
;; Date: Wed, 26 Jan 2011 16:01:52 +0000
; (add-to-list 'org-export-latex-packages-alist '("" "amsmath" t))
; (setcar (rassoc '("wasysym" t) org-export-latex-default-packages-alist)	"integrals")


(setq org-export-latex-listings t)
;(add-to-list 'org-export-latex-packages-alist '("" "listings"))
;(add-to-list 'org-export-latex-packages-alist '("" "color"))


; http://soundandcomplete.com/2011/11/18/typesetting-a-document-with-lots-of-code-listings-using-emacs-org-mode-minted-and-latex/
; minted latex export 
;; (setq org-export-latex-listings 'minted)
;; (setq org-export-latex-minted-options '(("frame" "lines") ("fontsize" "\\footnotesize")
;;     ("linenos" "")))
