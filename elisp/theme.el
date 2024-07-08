;; theme for emacs

(use-package spacemacs-theme
  :ensure t
  :init (setq spacemacs-theme-comment-bg nil
              spacemacs-theme-comment-italic t)
  :hook (after-init . (lambda () (load-theme 'spacemacs-light t))))

(provide 'theme)
