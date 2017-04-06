; From
; http://stackoverflow.com/questions/683425/globally-override-key-binding-in-emacs
; To avoid other modes to overwrite this keybindings, create a minor mode, and
; use this minor mode with all the mayor modes.

(defvar my-keys-minor-mode-map (make-keymap) "my-keys-minor-mode keymap.")

; Move between frames
(require 'windmove)
(define-key my-keys-minor-mode-map (kbd "s-b")  'windmove-left)
(define-key my-keys-minor-mode-map (kbd "s-f") 'windmove-right)
(define-key my-keys-minor-mode-map (kbd "s-p")    'windmove-up)
(define-key my-keys-minor-mode-map (kbd "s-n")  'windmove-down)

(define-key my-keys-minor-mode-map (kbd "C-.") 'next-multiframe-window)
(define-key my-keys-minor-mode-map (kbd "C-,") 'previous-multiframe-window)

(define-minor-mode my-keys-minor-mode
  "A minor mode so that my key settings override annoying major modes."
  t " my-keys" 'my-keys-minor-mode-map)

(my-keys-minor-mode 1)

; Turn minor mode off in the minibuffer
(defun my-minibuffer-setup-hook ()
  (my-keys-minor-mode 0))

(add-hook 'minibuffer-setup-hook 'my-minibuffer-setup-hook)

(defadvice load (after give-my-keybindings-priority)
  "Try to ensure that my keybindings always have priority."
  (if (not (eq (car (car minor-mode-map-alist)) 'my-keys-minor-mode))
      (let ((mykeys (assq 'my-keys-minor-mode minor-mode-map-alist)))
        (assq-delete-all 'my-keys-minor-mode minor-mode-map-alist)
        (add-to-list 'minor-mode-map-alist mykeys))))
(ad-activate 'load)


