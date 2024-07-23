;; modeline

(setq mode-line-position
      (list
       "  (" (propertize "%l" 'face 'font-lock-type-face)
       "," (propertize "%c" 'face 'font-lock-type-face) ")   "))

(defun mode-line-fill (reserve)
  (when
      (and window-system (eq 'right (get-scroll-bar-mode)))
    (setq reserve (- reserve 3)))
  (propertize " " 'display
	      `((space :align-to (- (+ right right-fringe right-margin) ,reserve)))))

(defun mode-line-flush-right (right-line)
  (let ((right-length (length (format-mode-line right-line))))
    (list (mode-line-fill right-length) right-line)))

(defun truncate-mode-line-construct (construct length)
  (let* ((full-string (format-mode-line construct))
         (truncated-string (truncate-string-to-width full-string length)))
    (replace-regexp-in-string "%" "%%" truncated-string)))

(setq-default mode-line-format
	      (list
	       '(:eval (propertize "%e" 'face 'font-lock-type-face))
	       mode-line-front-space
	       '(:eval (propertize "%@" 'face 'font-lock-constant-face))
	       '(:eval (propertize "%t%Z" 'face 'font-lock-string-face))
	       '(:eval (propertize "%*%+" 'face 'font-lock-warning-face))
	       '(:eval (propertize "  %F" 'face 'font-lock-keyword-face))
	       '(:eval (propertize "  %b" 'face 'font-lock-escape-face))
	       mode-line-position
               '(:eval (mode-line-flush-right
			(list
			 mode-line-modes
			 " ["
			 (propertize (truncate-mode-line-construct "%p" 3) 'face 'font-lock-comment-face)
			 (propertize ":" 'face 'font-lock-warning-face)
			 (propertize "%I" 'face 'font-lock-string-face)
			 "] "
			 mode-line-end-spaces)))))

(provide 'modeline)
