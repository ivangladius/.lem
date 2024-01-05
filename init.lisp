

(defpackage #:lem-user
  (:use #:cl
        #:lem)
  (:import-from #:lem/frame-multiplexer
                #:frame-multiplexer))
(in-package :lem-user)



(use-package :split-sequence)

;;(defun reload-init ()
;;  (lem-lisp-mode:lisp-load-file #P"/home/max/.lem/init.lisp"))
;;

(load-theme "emacs-dark")


(lem-vi-mode:vi-mode)

(define-key *global-keymap* "M-j" 'window-move-down)
(define-key *global-keymap* "M-h" 'window-move-down)

(define-key *global-keymap* "M-k" 'window-move-up)
(define-key *global-keymap* "M-j" 'window-move-down)
(define-key *global-keymap* "M-h" 'window-move-left)
(define-key *global-keymap* "M-l" 'window-move-right)
;;(define-key lem-vi-mode:*normal-keymap* "Meta h" 'window-move-left)
;;(define-key lem-vi-mode:*normal-keymap* "Meta l" 'window-move-right)
;;(define-key lem-vi-mode:*normal-keymap* "Space k" 'kill-buffer t)
(define-key lem-vi-mode:*normal-keymap* "Space i e" 'find-file)
(define-key lem-vi-mode:*normal-keymap* "Space i r" 'find-file-recursively)
(define-key lem-vi-mode:*normal-keymap* "Space i f" 'lem/list-buffers:list-buffers)
(define-key lem-vi-mode:*normal-keymap* "Space i q" 'grep)

(define-key lem-vi-mode:*normal-keymap* "Space h k" 'describe-key)
(define-key lem-vi-mode:*normal-keymap* "Space h l" 'reload-init)
(define-key lem-vi-mode:*normal-keymap* "Space 1" 'delete-other-windows)
(define-key lem-vi-mode:*normal-keymap* "Space 2" 'delete-active-window)
(define-key lem-vi-mode:*normal-keymap* "Space 3" 'split-active-window-horizontally)
(define-key lem-vi-mode:*normal-keymap* "Space 4" 'split-active-window-vertically)
;;(define-key lem-vi-mode:*visual-keymap* "Escape" 'vi-return)
(define-key lem-vi-mode:*normal-keymap* "," 'previous-page)
(define-key lem-vi-mode:*normal-keymap* "." 'next-page)



(defun my-run-command (command &optional buffer-name)
  (lem-shell-mode::create-shell-buffer
   (lem-process:run-process command
                            :name (or buffer-name command)
                            :output-callback 'lem-shell-mode::output-callback
                            :output-callback-type :process-input)))

;;(define-command async-command (command) ("sAsync shell command: ")
;;
;;        (display-bukkffer (my-run-command
;;                         (split-sequence #\space command)))))
;;
;;(define-key lem:*global-keymap* "M-&" 'async-command)
;;
;;(async-process:create-process "ls -all")


(defun myrunner (command)
  (let* ((command-output
          (async-process:process-receive-output
           (async-process:create-process command)))
         (command-output-buffer-title
           (concatenate 'string "PROCESS " command)))
    (make-buffer command-output-buffer-title)
    (lem:select-buffer command-output-buffer-title)
    (lem-base:insert-string (lem-base:current-point) command-output)))
    

;;(myrunner "ls")


