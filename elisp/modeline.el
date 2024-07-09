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
  (let ((charnum (length right-line)))
    (concat (mode-line-fill charnum) right-line)))

(setq-default mode-line-format
	      (list
	       '(:eval (propertize "%e"
				   'face 'font-lock-type-face))
	       mode-line-front-space
	       '(:eval (propertize "%@"
				   'face 'font-lock-constant-face))
	       '(:eval (propertize "%t%Z"
				   'face 'font-lock-string-face))
	       '(:eval (propertize "%*%+"
				   'face 'font-lock-warning-face))
	       '(:eval (propertize "  %F"
				   'face 'font-lock-keyword-face))
	       '(:eval (propertize "  %b"
				   'face 'font-lock-escape-face))
	       mode-line-position
               '(:eval (mode-line-flush-right
			(format-mode-line (list
					   mode-line-modes
					   " [" (propertize "%p" 'face 'font-lock-comment-face) "/" (propertize "%I" 'face 'font-lock-warning-face) "] "
					   mode-line-end-spaces))))
	       ))

(provide 'modeline)
