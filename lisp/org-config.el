;; flyspell mode for spell checking everywhere
(add-hook 'org-mode-hook 'turn-on-flyspell 'append)

;; Enable visual-line-mode
(add-hook 'org-mode-hook #'visual-line-mode)

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

;; To save the clock history across Emacs sessions, use 
(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)

; Set the agenda files
(setq org-agenda-files (list "~/Dropbox/org/agenda.org"))

; Archive all DONE tasks
; Based on https://stackoverflow.com/a/27043756, with 'tree changed by 'file
(defun org-archive-done-tasks ()
  (interactive)
  (org-map-entries
   (lambda ()
     (org-archive-subtree)
     (setq org-map-continue-from (org-element-property :begin (org-element-at-point))))
   "/DONE" 'agenda))
(define-key global-map "\C-cx" 'org-agenda)

; From http://pragmaticemacs.com/emacs/org-mode-basics-vii-a-todo-list-with-schedules-and-deadlines/
;;open agenda in current window
(setq org-agenda-window-setup (quote current-window))
;;warn me of any deadlines in next 7 days
(setq org-deadline-warning-days 0)
;;show me tasks scheduled or due in next fortnight and starting yesterday
(setq org-agenda-span (quote fortnight))
(setq org-agenda-start-day "0d")
(setq org-agenda-start-on-weekday nil)
;;don't show tasks as scheduled if they are already shown as a deadline
;(setq org-agenda-skip-scheduled-if-deadline-is-shown t)
;;don't give awarning colour to tasks with impending deadlines
;;if they are scheduled to be done
(setq org-agenda-skip-deadline-prewarning-if-scheduled (quote pre-scheduled))
;;don't show tasks that are scheduled or have deadlines in the
;;normal todo list
;(setq org-agenda-todo-ignore-deadlines (quote all))
;(setq org-agenda-todo-ignore-scheduled (quote all))
;;sort tasks in order of when they are due and then by priority
(setq org-agenda-sorting-strategy
  (quote
   ((agenda deadline-up priority-down)
    (todo priority-down category-keep)
    (tags priority-down category-keep)
    (search category-keep))))

;; For bookmarks. From:
;; https://karl-voit.at/2014/08/10/bookmarks-with-orgmode/
;; https://github.com/rexim/org-cliplink
(setq org-capture-templates
  '(
    ("b" "Bookmark" entry (file "~/Dropbox/org/bookmarks.org")
     "* %(org-cliplink-capture)\n" :empty-lines 0)
    ))

;(require 'org-latex) no longer required in newer emacs versions
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

;; Start with the outline folded
(setq org-startup-folded t)

;; Make windmove work in Org mode:
(add-hook 'org-shiftup-final-hook 'windmove-up)
(add-hook 'org-shiftleft-final-hook 'windmove-left)
(add-hook 'org-shiftdown-final-hook 'windmove-down)
(add-hook 'org-shiftright-final-hook 'windmove-right)
