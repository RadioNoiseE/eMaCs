;; melpa repositoory

(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(unless (bound-and-true-p package--initialized)
        (package-initialize))

(provide 'melpa)
