

; Start the server
;; http://lists.gnu.org/archive/html/help-gnu-emacs/2004-01/msg00869.html
;; ** emacsclient
(defun my-server-start-filter-function (process output)
  "Filter function for `my-server-start', which checks for an
accessible Emacs process acting as a server by calling
`emacsclient --eval t' as an external asynchronous
process. Process output is filtered by this function which only
calls `server-start' when no server is running, id est the call
to emacsclient has failed."
  (if (equal output "t\n")
      (message "Not starting server, one instance already running...")
    (message "Starting server...")
    (server-start)))

;;
(defun my-server-start ()
  "Call `server-start' only if no other accessible Emacs process
is already acting as a server for client processes."
  (let ((process-connection-type nil))
    (set-process-filter (start-process "my-process" nil "emacsclient" "--eval" 
"t")
                        'my-server-start-filter-function)))
;;

(my-server-start)

(require 'edit-server)
(edit-server-start)
