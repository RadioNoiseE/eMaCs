; file minimap

(use-package minimap
  :ensure t
  :defer t
  :init
  (setq minimap-width-fraction 0.10
        minimap-minimum-width 16
        minimap-window-location 'right)
  (defun minimap--customize nil
    (with-current-buffer minimap-buffer-name
      (setq-local fringe-indicator-alist (append '((continuation nil nil)) fringe-indicator-alist))
      (setq-local window-size-fixed 'width)
      (set-window-fringes (minimap-get-window) 1 1 nil)))
  :config (advice-add #'minimap-new-minimap :after #'minimap--customize))

(provide 'pview)
