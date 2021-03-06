; Enabling Ido mode everywhere. See
; http://emacs-fu.blogspot.com/2009/02/switching-buffers.html for a more
; detailed configuration
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
(setq ido-ignore-buffers ;; ignore these guys
  '("\\` " "^\*Mess" "^\*Back" ".*Completion" "^\*Ido" "^\*trace"

     "^\*compilation" "^\*GTAGS" "^session\.*" "^\*") )
(setq ido-enable-tramp-completion nil)

; Fix annoying behavior when creating a new file
(setq ido-auto-merge-work-directories-length -1)
