(setq inhibit-startup-message t)
(tool-bar-mode -1) ; hide the toolbar
(setq make-backup-files nil) ; Disable creation of backup files
(fset 'yes-or-no-p 'y-or-n-p)

;; Scrolling
(setq scroll-margin 0)
(setq scroll-conservatively 100000)
(setq scroll-preserve-screen-position 1)

;; Enable Delete Selection mode to replace a region just by typing text, and
;; kill the selected text just by hitting the Backspace key.
(delete-selection-mode 1)

;; Enable column numbering
(column-number-mode 1)

;; Enable show parenthesis mode
(show-paren-mode 1)

;; Set column width to 79 characters
(setq-default fill-column 79)

;; Update files modified externally
;; See http://www.emacswiki.org/emacs/RevertBuffer
(global-auto-revert-mode t)

;; Save customization configuration in a file differente than init.el
(setq custom-file "~/.emacs.d/lisp/.emacs-custom.el")

;; Always use english for dates
(setq system-time-locale "C")

;;;;;;;;;;;;;;;;;;; Key Bindings
;; Magit
(global-set-key (kbd "C-x g") 'magit-status)
;; org-mode
(global-set-key (kbd "<f12>") 'org-capture)
;; Since M-Tab is used by the OS, we remap it here
(global-set-key (kbd "C-x t") 'pcomplete)


;; Some useful packages
(use-package try
:ensure t)

(use-package which-key
:ensure t
:config
(which-key-mode))

;; on the fly syntax checking
(use-package flycheck
:ensure t
:init
(global-flycheck-mode t))

;; snippets and snippet expansion
(use-package yasnippet
:ensure t
:init
(yas-global-mode 1))

;; Spaceline
(use-package spaceline
  :ensure t
  )

;;;;;;;;; Consel and swiper ;;;;;;;;;;;;;
(use-package counsel
  :ensure t
  :init
  (spaceline-emacs-theme)
  )

(use-package swiper
:ensure try
:config
(progn
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-load-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
(define-key read-expression-map (kbd "C-r") 'counsel-expression-history)
))

;; Muestra el reloj en formato 24 hrs
(setq display-time-24hr-format t) ; Muestra el reloj en formato 24 hrs
(setq display-time-format "%H:%M"); Le da formato H:M
(display-time) ; muestra el reloj


;;;;; From old basic-config.el


;; ; Set google-chrome as default browser
;; ; Should we use w3m?
;; (setq browse-url-browser-function 'browse-url-generic
;;       browse-url-generic-program "google-chrome")

;; ;(load custom-file)

;; (when (memq window-system '(x mac ns))
;;   (exec-path-from-shell-initialize))

;; ; Enable spell check on text mode
;; (add-hook 'text-mode-hook 'flyspell-mode) ;turn on flyspell mode by default
;; (add-hook 'text-mode-hook 'turn-on-flyspell)
;; (add-hook 'text-mode-hook 'visual-line-mode)

;; ; Enable pdf-tools
;; ;(pdf-tools-install)

;; (defalias 'list-buffers 'ibuffer)


