;; lsp intergration

(use-package eglot
  :ensure t
  :defer t
  :hook ((c-mode . eglot-ensure)
	 (c++-mode . eglot-ensure)
	 (LaTeX-mode . eglot-ensure)
	 (plain-TeX-mode . (lambda ()
			     (put 'plain-TeX-mode 'eglot-language-id "plain")
			     (eglot-ensure)))
	 (AmSTeX-mode . (lambda ()
			  (put 'AmSTeX-mode 'eglot-language-id "plain")
			  (eglot-ensure))))
  :config (with-eval-after-load 'eglot (dolist (mode-server '((plain-TeX-mode . ("digestif"))
							      (AmSTeX-mode . ("digestif"))
			                                      (LaTeX-mode . ("texlab"))))
                                         (add-to-list 'eglot-server-programs mode-server))))

(provide 'lsp)
