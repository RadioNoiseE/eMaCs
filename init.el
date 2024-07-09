;;; init.el -*- lexical-binding: t -*-

;; This file bootstraps the configuration, which is divided into
;; a number of other files.

(add-to-list 'load-path (expand-file-name "elisp" user-emacs-directory))

(let ((normal-gc-cons-threshold (* 20 1024 1024))
      (init-gc-cons-threshold (* 128 1024 1024)))
  (setq gc-cons-threshold init-gc-cons-threshold)
  (add-hook 'emacs-startup-hook
      (lambda () (setq gc-cons-threshold normal-gc-cons-threshold))))

(require 'melpa)
(require 'package)
;(require 'roll)

(require 'preferences)
(require 'font)
(require 'theme)
(require 'modeline)

(require 'highlight)
(require 'vilayer)
(require 'listsel)
(require 'keyrem)

(require 'lsp)
(require 'autocomplete)

(require 'cjk)

(require 'pdf)
(require 'markup)

(provide 'init)

;;; init.el ends here

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("bbb13492a15c3258f29c21d251da1e62f1abb8bbd492386a673dcfab474186af" default))
 '(package-selected-packages '(use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
