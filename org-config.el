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