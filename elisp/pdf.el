;; pdf optimisations

(use-package pdf-tools
  :ensure t
  :magic ("%PDF" . pdf-view-mode)
  :config (pdf-tools-install :no-query))

(provide 'pdf)
