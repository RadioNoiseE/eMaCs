;; teco mode from LdBeth

(autoload 'teco-mode "teco-mode" nil t)
(let ((teco-extensions '("\\.tes\\'" "\\.teco\\'" "\\.tec\\'")))
  (dolist (ext teco-extensions)
    (add-to-list 'auto-mode-alist `(,ext . teco-mode))))

(provide 'teco)
