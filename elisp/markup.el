;; markup language enhancements

(use-package org-bullets
  :ensure t
  :defer t
  :hook (org-mode . org-bullets-mode))

(use-package tex
  :ensure auctex
  :defer t
  :init (set-default 'preview-scale-function 0.72))

(provide 'markup)
