;; lsp intergration

(use-package eglot
  :ensure t
  :defer t
  :hook ((c-mode . eglot-ensure)
	 (c++-mode . eglot-ensure)
	 (plain-TeX-mode . eglot-ensure)
	 (LaTeX-mode . eglot-ensure)
	 (AmSTeX-mode . eglot-ensure))
  :config (with-eval-after-load 'eglot (dolist (mode-server '((plain-TeX-mode . ("digestif"))
			                                      (LaTeX-mode . ("texlab"))))
                                         (add-to-list 'eglot-server-programs mode-server))))

(provide 'lsp)
