(setenv "PATH"
        (concat
         "C:/texlive/2023/bin/windows/" path-separator
         (getenv "PATH")))

; Set the agenda files
(setq org-agenda-files
      (list (if (string-equal (system-name) "DESKTOP-S58VG48")
                "c:/Users/Alejandro Weinstein/Dropbox/org/agenda.org"
              "c:/Users/ajw/Dropbox/org/agenda.org")))

