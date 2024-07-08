;; package update and use-package

(defun package-auto-update ()
  "Automatically update all packages every Sunday."
  (when (equal (format-time-string "%u") "7")
    (message "Checking for package updates...")
    (package-refresh-contents)
    (package-menu-mark-upgrades)
    (let ((upgradable-packages (package-menu--find-upgrades)))
      (if upgradable-packages
          (progn
            (package-menu-mark-upgrades)
            (package-menu-execute 'no-query)
            (message "Packages updated."))
        (message "No package updates available.")))))

(unless (bound-and-true-p package--initialized)
  (package-initialize))

(add-hook 'emacs-startup-hook 'package-auto-update)


(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(setq use-package-always-ensure t)

(provide 'package)
