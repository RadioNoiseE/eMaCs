;; preferences

(global-auto-revert-mode t)
(delete-selection-mode t)
(electric-pair-mode t)

(when (display-graphic-p) (toggle-scroll-bar -1)
                          (tool-bar-mode -1)
                         ;(menu-bar-mode -1)
			  (pixel-scroll-precision-mode 1))

(setq inhibit-startup-message t)
(setq display-line-numbers-type 'relative)

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(provide 'preferences)
