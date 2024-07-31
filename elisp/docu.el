; eldoc in a child frame

(use-package eldoc-box
  :ensure t
  :hook ((eglot-managed-mode . eldoc-box-hover-at-point-mode)
	 (eldoc-mode . eldoc-box-hover-at-point-mode)))

(provide 'docu)
