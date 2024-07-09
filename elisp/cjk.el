;; CJK enhancements

(use-package fcitx
  :ensure t
  :init (setq fcitx-use-dbus nil
              fcitx-remote-command "fcitx5-remote")
  :config (fcitx-aggressive-setup))

(use-package valign
  :ensure t
  :defer t
  :hook (org-mode . valign-mode))

(with-eval-after-load 'ox-latex (dolist (cjk-classes '(("smpl"
							"\\makeatletter\\def\\ltj@stdmcfont{NotoSerifCJKSC}\\def\\ltj@stdgtfont{NotoSansCJKSC}\\def\\ltj@stdtatejfm{eva/{smpl,vert,nstd}}\\def\ltj@stdyokojfm{eva/{smpl,nstd}}\\makeatother\\documentclass{ltjsreport}"
							("\\chapter{%s}" . "\\chapter*{%s}")
							("\\section{%s}" . "\\section*{%s}")
							("\\subsection{%s}" . "\\subsection*{%s}")
							("\\subsubsection{%s}" . "\\subsubsection*{%s}"))
						       ("trad"
							"\\makeatletter\\def\\ltj@stdmcfont{NotoSerifCJKTC}\\def\\ltj@stdgtfont{NotoSansCJKTC}\\def\\ltj@stdtatejfm{eva/{trad,vert,nstd}}\\def\ltj@stdyokojfm{eva/{trad,nstd}}\\makeatother\\documentclass{ltjsreport}"
							("\\chapter{%s}" . "\\chapter*{%s}")
							("\\section{%s}" . "\\section*{%s}")
							("\\subsection{%s}" . "\\subsection*{%s}")
							("\\subsubsection{%s}" . "\\subsubsection*{%s}"))
						       ("jajp"
							"\\makeatletter\\def\\ltj@stdmcfont{NotoSerifCJK}\\def\\ltj@stdgtfont{NotoSansCJK}\\def\\ltj@stdtatejfm{eva/{ja,vert,nstd}}\\def\ltj@stdyokojfm{eva/{ja,nstd}}\\makeatother\\documentclass{ltjsreport}"
							("\\chapter{%s}" . "\\chapter*{%s}")
							("\\section{%s}" . "\\section*{%s}")
							("\\subsection{%s}" . "\\subsection*{%s}")
							("\\subsubsection{%s}" . "\\subsubsection*{%s}"))))
				  (add-to-list 'org-latex-classes cjk-classes)))

(setq org-emphasis-regexp-components
      (list (concat " \t('\"{"            "[:nonascii:]")
            (concat "- \t.,:!?;'\")}\\["  "[:nonascii:]")
            " \t\r\n,\"'"
            "."
            1))

(defun cjk/org-element--parse-generic-emphasis (mark type)
  (save-excursion
    (let ((origin (point)))
      (unless (bolp) (forward-char -1))
      (let ((opening-re
             (rx-to-string
              `(seq (or line-start (any space ?- ?\( ?' ?\" ?\{ nonascii))
                    ,mark
                    (not space)))))
        (when (looking-at opening-re)
          (goto-char (1+ origin))
          (let ((closing-re
                 (rx-to-string
                  `(seq
                    (not space)
                    (group ,mark)
                    (or (any space ?- ?. ?, ?\; ?: ?! ?? ?' ?\" ?\) ?\} ?\\ ?\[
                             nonascii)
                        line-end)))))
            (when (re-search-forward closing-re nil t)
              (let ((closing (match-end 1)))
                (goto-char closing)
                (let* ((post-blank (skip-chars-forward " \t"))
                       (contents-begin (1+ origin))
                       (contents-end (1- closing)))
                  (list type
                        (append
                         (list :begin origin
                               :end (point)
                               :post-blank post-blank)
                         (if (memq type '(code verbatim))
                             (list :value
                                   (and (memq type '(code verbatim))
                                        (buffer-substring
                                         contents-begin contents-end)))
                           (list :contents-begin contents-begin
                                 :contents-end contents-end)))))))))))))
(advice-add #'org-element--parse-generic-emphasis :override #'cjk/org-element--parse-generic-emphasis)

(with-eval-after-load 'org
  (setq org-match-substring-regexp
        (concat
         "\\([0-9a-zA-Zα-γΑ-Ω]\\)\\([_^]\\)\\("
         "\\(?:" (org-create-multibrace-regexp "{" "}" org-match-sexp-depth) "\\)"
         "\\|"
         "\\(?:" (org-create-multibrace-regexp "(" ")" org-match-sexp-depth) "\\)"
         "\\|"
         "\\(?:\\*\\|[+-]?[[:alnum:].,\\]*[[:alnum:]]\\)\\)")))

(provide 'cjk)
