;; markup language enhancements

(use-package org-bullets
  :ensure t
  :defer t
  :hook (org-mode . org-bullets-mode))

(use-package table
  :ensure t
  :defer t)

(setq org-startup-align-all-tables 'align)

(use-package htmlize
  :ensure t
  :defer t)

(use-package tex
  :ensure auctex
  :defer t
  :init (set-default 'preview-scale-function 0.72))

(with-eval-after-load 'font-latex
  (add-hook 'LaTeX-mode-hook 'ltx/expl3-font-lock)
  (add-hook 'docTeX-mode-hook 'ltx/expl3-font-lock)
  (defun ltx/expl3-font-lock ()
    (let ((signatures "NncVvoxefTFpwD")
          (vartypes '("clist" "dim" "fp" "int" "muskip" "seq" "skip"
                      "str" "tl" "bool" "box" "coffin" "flag" "fparray"
                      "intarray" "ior" "iow" "prop" "regex")))
      (font-lock-add-keywords nil
			      `((,(concat "\\(\\\\\\(?:@@_\\|\\(?:__\\)?[a-zA-Z]+_\\)[a-zA-Z_]+\\)"
					  "\\(:[" signatures "]*\\)")
				 . ((1 'font-lock-keyword-face)
				    (2 'font-lock-type-face)))
				(,(concat "\\(\\\\[lgc]_[a-zA-Z@_]+"
					  "_\\(?:" (mapconcat #'identity vartypes "\\|") "\\)\\_>"
					  "\\)")
				 1 'font-lock-variable-name-face))))))

(setq TeX-view-program-selection '((output-pdf "PDF Tools"))
      TeX-view-program-list '(("PDF Tools" TeX-pdf-tools-sync-view)))

(provide 'markup)
