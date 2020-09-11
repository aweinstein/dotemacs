; Setup ELPA packaging system
; Don't forget to run package-refresh-content

;; (when (>= emacs-major-version 24)
;;   (require 'package)
;;   (package-initialize)
;;   (add-to-list 'package-archives 
;; 	       '("melpa" . "http://melpa.org/packages/")
;; 	       t)
;;   ;; (add-to-list 'package-archives
;;   ;; 	       '("elpy" . "http://jorgenschaefer.github.io/packages/")
;;   ;; 	       )
;;   (add-to-list 'package-archives
;;   	       '("gnu" . "http://elpa.gnu.org/packages/")
;;   	       )
;;   )


(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)
