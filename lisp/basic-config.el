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
  (add-hook 'python-mode-hook #'flycheck-mode))

;; snippets and snippet expansion
(use-package yasnippet
  :ensure t
  :config
  (use-package yasnippet-snippets
    :ensure t)
  :init
  (yas-global-mode 1)
  ;; Avoid confict with autocomplete
  (define-key yas-minor-mode-map (kbd "<tab>") nil)
  (define-key yas-minor-mode-map (kbd "TAB") nil)
  (define-key yas-minor-mode-map (kbd "<C-tab>") 'yas-expand)
  )

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

;; From https://github.com/rememberYou/.emacs.d/blob/master/config.org#auto-completion
(use-package company
  :ensure t
  :after lsp-mode
  :hook (lsp-mode . company-mode)
  :custom
  (company-begin-commands '(self-insert-command))
  (company-idle-delay 0.5)
  (company-minimum-prefix-length 1)
  (company-show-quick-access t)
  (company-tooltip-align-annotations 't)
)

;; Muestra el reloj en formato 24 hrs
(setq display-time-24hr-format t) ; Muestra el reloj en formato 24 hrs
(setq display-time-format "%H:%M"); Le da formato H:M
(setq display-time-default-load-average nil)
(display-time) ; muestra el reloj

;; Use ibuffer
(defalias 'list-buffers 'ibuffer)
;; (defalias 'list-buffers 'ibuffer-other-window)

;; UI improvements from  https://www.youtube.com/watch?v=IspAZtNTslY
;; Show line numbers 
(column-number-mode)
(global-display-line-numbers-mode t)
;; Disable line numbers for some modes
(dolist (mode '(org-mode-hook
		term-mode-hook
		eshell-mode-hook
		org-agenda-mode-hook
		help-mode-hook
		compilation-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

(windmove-default-keybindings)

(winner-mode)

;; Prefer to reuse existing windows, especially those showing a buffer
;; of the same mode
;; From https://github.com/daviwil/emacs-from-scratch/blob/master/show-notes/Emacs-Tips-DisplayBuffer-1.org
(setq display-buffer-base-action
  '((display-buffer-reuse-window
     display-buffer-reuse-mode-window
     display-buffer-same-window
     display-buffer-in-previous-window)))
