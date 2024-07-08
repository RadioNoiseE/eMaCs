;; list-selection with ivy

(use-package ivy
  :ensure t
  :init (setq ivy-use-virtual-buffers t
	      ivy-count-format "(%d/%d) ")
  :config (ivy-mode 1))

(provide 'listsel)
