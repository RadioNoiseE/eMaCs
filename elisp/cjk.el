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

(provide 'cjk)
