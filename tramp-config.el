;http://stackoverflow.com/questions/715855/how-can-i-use-emacs-tramp-to-double-hop-ssh
;open a file as
; /ssh:ajw@shiner.mines.edu:
(require 'tramp)
(add-to-list 'tramp-default-proxies-alist
 	     '("shiner.mines.edu" nil "/ssh:aweinste@imagine.mines.edu:"))

; Show host name
; http://www.gnu.org/software/emacs/manual/html_node/tramp/Frequently-Asked-Questions.html

;; (defconst my-mode-line-buffer-identification
;;   (list
;;    '(:eval
;;      (let (
;; 	   ;; (host-name
;; 	   ;;  (or (file-remote-p default-directory 'host)
;; 	   ;; 	(system-name)))
;; 	   ;; )
;; 	   (host-name
;; 	    (or (file-remote-p default-directory ('host))
;; 	   	("")))
;; 	   )

;;        (if (string-match "^[^0-9][^.]*\\(\\..*\\)" host-name)
;; 	   (substring host-name 0 (match-beginning 1))
;; 	 host-name)))
;;    "%12b"))

;; (setq-default
;;  mode-line-buffer-identification
;;  my-mode-line-buffer-identification)


;; (add-hook
;;  'dired-mode-hook
;;  '(lambda ()
;;     (setq
;;      mode-line-buffer-identification
;;      my-mode-line-buffer-identification)))
