;; CJK enhancements

(use-package fcitx
  :ensure t
  :init (setq fcitx-use-dbus nil
              fcitx-remote-command "fcitx5-remote")
  :config (fcitx-aggressive-setup))

(use-package valign
  :ensure t
  :defer t
  :init (setq valign-fancy-bar t)
  :hook (org-mode . valign-mode))

(provide 'cjk)
