(defpackage #:lem-user
  (:use #:cl
        #:lem)
  (:import-from #:lem/frame-multiplexer
                #:frame-multiplexer))
(in-package :lem-user)

;;(define-command reload-init () ()
;;  (lem-lisp-mode:lisp-load-file #P"/home/max/.lem/init.lisp"))


(lem-lisp-mode:lisp-load-file #P"~/.lem/editing.lisp")


(load-theme "outrun-dark")


(define-key *global-keymap* "M-k" 'window-move-up)
(define-key *global-keymap* "M-j" 'window-move-down)
(define-key *global-keymap* "M-h" 'window-move-left)
(define-key *global-keymap* "M-l" 'window-move-right)
;;(define-key lem-vi-mode:*normal-keymap* "Meta h" 'window-move-left)
;;(define-key lem-vi-mode:*normal-keymap* "Meta l" 'window-move-right)
;;(define-key lem-vi-mode:*normal-keymap* "Space k" 'kill-buffer t)
;;(define-key lem-vi-mode:*normal-keymap* "Space i e" 'find-file)
;;(define-key lem-vi-mode:*normal-keymap* "Space i r" 'find-file-recursively)
;;(define-key lem-vi-mode:*normal-keymap* "Space i f" 'lem/list-buffers:list-buffers)

(define-key *global-keymap* "C-M-N" 'previous-buffer)
(define-key *global-keymap* "C-M-P" 'next-buffer)

(define-command kill-window () ()
  (kill-buffer (current-buffer)))
(define-key *global-keymap* "M-K" 'kill-window)

;;(define-key lem-vi-mode:*normal-keymap* "Space i q" 'grep)

(define-key lem-vi-mode:*normal-keymap* "Space h k" 'describe-key)
(define-key lem-vi-mode:*normal-keymap* "Space h l" 'reload-init)
;;(define-key lem-vi-mode:*normal-keymap* "Space 1" 'delete-other-windows)
;;(define-key lem-vi-mode:*normal-keymap* "Space 2" 'delete-active-window)
;;(define-key lem-vi-mode:*normal-keymap* "Space 4" 'split-active-window-horizontally)
;;(define-key lem-vi-mode:*normal-keymap* "Space 3" 'split-active-window-vertically)
(define-key *global-keymap* "M-c" 'copy-region)
(define-key *global-keymap* "C-/" 'undo)
(define-key *global-keymap* "C-M-/" 'redo)

(define-key lem-vi-mode:*normal-keymap**global-keymap* "M-w 1" 'delete-other-windows)
(define-key lem-vi-mode:*normal-keymap* "M-w 2" '-active-window)
(define-key lem-vi-mode:*normal-keymap* "M-w 3" 'split-active-window-horizontally)
(define-key lem-vi-mode:*normal-keymap* "M-w 4" 'split-active-window-vertically)





;;(define-key *global-keymap* "M-o" 'delete-other-windows)
;;(define-key *global-keymap* "M-p" 'delete-active-window)
;;(define-key *global-keymap* "M-[" 'split-active-window-horizontally)
;;(define-key *global-keymap* "M-]" 'split-active-window-vertically)

;;(define-key *global-keymap* "M-o" 'kill-window)
;;(define-key *global-keymap* "M-o" 'kill-window)
;;(define-key *global-keymap* "M-o" 'kill-window)
;;(define-key *global-keymap* "M-o" 'kill-window)


(define-command open-lem-config () ()
  (lem:find-file "~/programs/lem/src/"))

(define-command grep-lem-src () ()
  (open-lem-config)
  (lem/grep::project-grep))

(define-key *global-keymap* "M-q c" 'open-lem-config)
(define-key *global-keymap* "M-q C" 'grep-lem-src)

(define-key *global-keymap* "M-q o" 'find-file)
(define-key *global-keymap* "M-q i" 'find-file-recursively)
(define-key *global-keymap* "M-q j" 'lem/list-buffers:list-buffers)
(define-key *global-keymap* "M-q h" 'lem/grep::project-grep)


(define-key *global-keymap* "M-e o" 'lem-lisp-mode:lisp-compile-defun)
(define-key *global-keymap* "M-e i" 'lem-lisp-mode/eval::lisp-eval-at-point)

;;(define-key lem-vi-mode:*normal-keymap* ", r" 'lem-lisp-mode:lisp-compile-defun)
;;(define-key lem-vi-mode:*normal-keymap* ", e" 'lem-lisp-mode/eval::lisp-eval-at-point)


(define-key *global-keymap* "M-." 'previous-page)
(define-key *global-keymap* "M-," 'next-page)
;;(define-key lem-vi-mode:*visual-keymap* "Escape" 'vi-return)

(defun my-run-command (command &optional buffer-name)
  (lem-shell-mode::create-shell-buffer
   (lem-process:run-process command
                            :name (or buffer-name command)
                            :output-callback 'lem-shell-mode::output-callback
                            :output-callback-type :process-input)))


;; set TAB to ctrl for no pinky finger
(uiop:run-program '("setxkbmap" "-option" "ctrl:nocaps"))

 

;;(define-command async-command (command) ("sAsync shell command: ")
;;
;;        (display-bukkffer (my-run-command
;;                         (split-sequence #\space command)))))
;;
;;(define-key lem:*global-keymap* "M-&" 'async-command)
;;
;;(async-process:create-process "ls -all")


;;(defun myrunner (command)
;;  (let* ((command-output
;;          (async-process:process-receive-output
;;           (async-process:create-process command)))
;;         (command-output-buffer-title
;;           (concatenate 'string "PROCESS " command)))
;;    (make-buffer command-output-buffer-title)
;;    (lem:select-buffer command-output-buffer-title)
;;    (lem-base:insert-string (lem-base:current-point) command-output)))
    

;;(myrunner "ls")


