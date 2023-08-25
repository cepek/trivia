;; To insert tab: CRTL Q Tab

;; Use CUA mode, turn off if needed from Options menu.

;;; (cua-mode t)


;; change all promts to y or n
(fset 'yes-or-no-p 'y-or-n-p)


;; Show trailing whitespaces and delete before save


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

(package-initialize)

(add-hook 'before-save-hook 'delete-trailing-whitespace)
(setq-default show-trailing-whitespace t)


(defun endless/c-hook ()
  (setq indent-tabs-mode nil))
(add-hook 'c++-mode-hook #'endless/c-hook)


;; Headers in c++-mode

(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))


;; Compilation output
(setq compilation-scroll-output t)


;; C++ completition C-M-i

(add-hook 'c++-mode-hook 'irony-mode)
;; (add-hook 'c-mode-hook 'irony-mode)
;; (add-hook 'objc-mode-hook 'irony-mode)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)


;; Using Octave Mode
(setq auto-mode-alist
      (cons '("\\.m$" . octave-mode) auto-mode-alist))


;; https://www.emacswiki.org/emacs/ToggleWindowSplit
;;
;; Vertical split shows more of each line, horizontal split shows
;; more lines. This code toggles between them. It only works for
;; frames with exactly two windows. The top window goes to the left
;; or vice-versa. I was motivated by ediff-toggle-split and helped
;; by TransposeWindows. There may well be better ways to write this.

(defun toggle-window-split ()
  (interactive)
  (if (= (count-windows) 2)
      (let* ((this-win-buffer (window-buffer))
	     (next-win-buffer (window-buffer (next-window)))
	     (this-win-edges (window-edges (selected-window)))
	     (next-win-edges (window-edges (next-window)))
	     (this-win-2nd (not (and (<= (car this-win-edges)
					 (car next-win-edges))
				     (<= (cadr this-win-edges)
					 (cadr next-win-edges)))))
	     (splitter
	      (if (= (car this-win-edges)
		     (car (window-edges (next-window))))
		  'split-window-horizontally
		'split-window-vertically)))
	(delete-other-windows)
	(let ((first-win (selected-window)))
	  (funcall splitter)
	  (if this-win-2nd (other-window 1))
	  (set-window-buffer (selected-window) this-win-buffer)
	  (set-window-buffer (next-window) next-win-buffer)
	  (select-window first-win)
	  (if this-win-2nd (other-window 1))))))

(define-key ctl-x-4-map "t" 'toggle-window-split)


;; F1...F12 keys
;;
;; F5-F9 are reserved for users. If you set any other function key,
;; you are likely overwriting some existing keybinding.

(global-set-key [f4] 'ff-find-other-file)  ; switch cpp and header files
(global-set-key [f5] 'toggle-window-split) ; togle window split


;; Numbering ...

(setq global-display-line-numbers-mode t)
(setq column-number-mode t)


;; Themes ...

(add-hook 'after-init-hook (lambda () (load-theme 'leuven)))


(add-to-list 'load-path "~/.emacs.d/local/")
(add-hook 'cmake-mode-hook
   (lambda () (load "create-basic-cmake-cxx-project.el")))
(add-hook 'c++-mode-hook (lambda()(load "insert-include-guards.el")))

(setq global-display-line-numbers-mode t)
(setq global-display-line-numbers-mode t)

(setq inhibit-startup-screen t)

(require 'package)
;;(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
;; (package-initialize)  ; Unnecessary call to ‘package-initialize’
