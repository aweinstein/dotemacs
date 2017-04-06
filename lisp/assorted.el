; Based on http://emacs-fu.blogspot.com/2011/01/setting-frame-title.html
(setq frame-title-format
  '("" (:eval (if (buffer-name) (abbreviate-file-name (buffer-name)) "%b"))))
