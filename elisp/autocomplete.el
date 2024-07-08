;; auto-complete via company-mode

(use-package company
  :ensure t
  :defer t
  :init
  (setq company-idle-delay 0.2
        company-minimum-prefix-length 2)
  :hook (after-init . global-company-mode))

(provide 'autocomplete)
