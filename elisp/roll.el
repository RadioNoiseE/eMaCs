;; package auto-update

(use-package auto-package-update
  :ensure t
  :init (setq auto-package-update-prompt-before-update t
	      auto-package-update-delete-old-versions t)
  :config (auto-package-update-maybe))

(provide 'roll)
