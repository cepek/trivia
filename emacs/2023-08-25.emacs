;;disable splash screen and startup message

(setq inhibit-startup-message t) 
(setq initial-scratch-message nil)


;; I had to set 4 spaces for indentation first
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(defvaralias 'c-basic-offset 'tab-width)
; (defvaralias 'cperl-indent-level 'tab-width)


(set-face-attribute 'region nil :background "#cce5ff")


; ----------------------------------------------------------


;; https://linuxhint.com/c_emacs_configuration/


(require 'package)
(add-to-list 'package-archives
                 '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(use-package try :ensure t)
(use-package which-key :ensure t :config (which-key-mode))
 
 


(use-package auto-complete
  :ensure t
  :init
  (progn
        (ac-config-default)
        (global-auto-complete-mode t)
        ))


    
;;;;; (use-package auto-complete
;;;;; (use-package flycheck
;;;;;   :ensure t
;;;;;   :init
;;;;  (global-flycheck-mode t)) ... nefunguje




(use-package modern-cpp-font-lock
:ensure t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(modern-cpp-font-lock auto-complete which-key try use-package markdown-mode irony imenu-list company cmake-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
