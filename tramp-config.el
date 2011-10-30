; use sudo through tramp
; from http://stackoverflow.com/questions/3465567/how-to-use-ssh-and-sudo-together-with-tramp-in-emacs
; open the remote file as C-x C-f /sudo:root@host[#port]:/path/to/file
(set-default 'tramp-default-proxies-alist (quote ((".*" "\\`root\\'" "/ssh:%h:"))))
