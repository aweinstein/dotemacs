; Load CEDET
;(load-file "~/.emacs.d/cedet/common/cedet.el")
(load-file "~/.emacs.d/cedet-1.0pre6/common/cedet.el")

;; For more info see
;; https://github.com/alexott/emacs-configs/blob/master/rc/emacs-rc-cedet.el
;; http://alexott.net/en/writings/emacs-devenv/EmacsCedet.html

;; From http://www.emacswiki.org/emacs/SpeedBar#toc2
(require 'speedbar)
(defconst my-speedbar-buffer-name "SPEEDBAR")
					; (defconst my-speedbar-buffer-name " SPEEDBAR") ; try this if you get "Wrong type argument: stringp, nil"
(defun my-speedbar-no-separate-frame ()
  (interactive)
  (when (not (buffer-live-p speedbar-buffer))
    (setq speedbar-buffer (get-buffer-create my-speedbar-buffer-name)
	  speedbar-frame (selected-frame)
	  dframe-attached-frame (selected-frame)
	  speedbar-select-frame-method 'attached
	  speedbar-verbosity-level 0
	  speedbar-last-selected-file nil)
    (set-buffer speedbar-buffer)
    (speedbar-mode)
    (speedbar-reconfigure-keymaps)
    (speedbar-update-contents)
      (speedbar-set-timer 1)
      (make-local-hook 'kill-buffer-hook)
      (add-hook 'kill-buffer-hook
                (lambda () (when (eq (current-buffer) speedbar-buffer)
                             (setq speedbar-frame nil
                                   dframe-attached-frame nil
                                   speedbar-buffer nil)
                             (speedbar-set-timer nil)))))
  (set-window-buffer (selected-window) 
		     (get-buffer my-speedbar-buffer-name)))


; Disbable the speedbar icons
(setq speedbar-use-images nil)

; Use sr-speedbar
; http://www.emacswiki.org/emacs/SrSpeedbar
(require 'sr-speedbar)

