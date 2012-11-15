(setq py-install-directory "~/.emacs.d/python-mode")
(add-to-list 'load-path py-install-directory)

(require 'python-mode)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; From http://www.jesshamrick.com/2012/09/18/emacs-as-a-python-ide/
; https://raw.github.com/jhamrick/blog/master/emacs-python-tutorial/settings/python-settings.el

; use IPython
(setq-default py-shell-name "ipython")
(setq-default py-which-bufname "IPython")

; Don't split windows
(setq py-split-windows-on-execute-p nil)

; Don't indent comments
(setq py-indent-comments nil)

;; http://astrofrog.github.com/astropy/development/codeguide_emacs.html
;; Automatically remove trailing whitespace when file is saved.
(add-hook 'python-mode-hook
          (lambda()
            (add-hook 'local-write-file-hooks
                      '(lambda()
                         (save-excursion
                           (delete-trailing-whitespace))))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; pylookup ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; add pylookup to your loadpath, ex) ~/.emacs.d/pylookup
(setq pylookup-dir "~/.emacs.d/pylookup")
(add-to-list 'load-path pylookup-dir)

;; load pylookup when compile time
(eval-when-compile (require 'pylookup))

;; set executable file and db file
(setq pylookup-program (concat pylookup-dir "/pylookup.py"))
(setq pylookup-db-file (concat pylookup-dir "/pylookup.db"))

;; set search option if you want
;; (setq pylookup-search-options '("--insensitive" "0" "--desc" "0"))

;; to speedup, just load it on demand
(autoload 'pylookup-lookup "pylookup"
  "Lookup SEARCH-TERM in the Python HTML indexes." t)

(autoload 'pylookup-update "pylookup" 
  "Run pylookup-update and create the database at `pylookup-db-file'." t)
(global-set-key "\C-ch" 'pylookup-lookup)
