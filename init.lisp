

(defpackage #:lem-my-init
  (:use #:cl
        #:lem)
  (:import-from #:lem/frame-multiplexer
                #:frame-multiplexer))
(in-package :lem-my-init)

;;(defun reload-init ()
;;  (lem-lisp-mode:lisp-load-file #P"/home/max/.lem/init.lisp"))
;;

(load-theme "default-dark")


(lem-vi-mode:vi-mode)
(define-key *global-keymap* "M-k" 'window-move-up)
(define-key *global-keymap* "M-j" 'window-move-down)
(define-key *global-keymap* "M-h" 'window-move-left)
(define-key *global-keymap* "M-l" 'window-move-right)
;;(define-key lem-vi-mode:*normal-keymap* "Meta h" 'window-move-left)
;;(define-key lem-vi-mode:*normal-keymap* "Meta l" 'window-move-right)
(define-key lem-vi-mode:*normal-keymap* "Space Tab" 'switch-to-last-focused-window)
(define-key lem-vi-mode:*normal-keymap* "Space k" 'kill-buffer t)
(define-key lem-vi-mode:*normal-keymap* "Space h k" 'describe-key)
(define-key lem-vi-mode:*normal-keymap* "Space h l" 'reload-init)
(define-key lem-vi-mode:*normal-keymap* "Space 1" 'delete-other-windows)
(define-key lem-vi-mode:*normal-keymap* "Space 2" 'delete-active-window)
(define-key lem-vi-mode:*normal-keymap* "Space 3" 'split-active-window-horizontally)
(define-key lem-vi-mode:*normal-keymap* "Space 4" 'split-active-window-vertically)
(define-key lem-vi-mode:*visual-keymap* "Escape" 'vi-return)
(define-key lem-vi-mode:*normal-keymap* "," 'previous-page)
(define-key lem-vi-mode:*normal-keymap* "." 'next-page)

