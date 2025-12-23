fundamental-mode ;; Available everywhere
(today (format-time-string "%Y-%m-%d"))
(fixme (make-string 2 (string-to-char comment-start)) "FIXME(florian): " r (format-time-string " (%d.%m.%Y, %H:%M)"))
(td (make-string 2 (string-to-char comment-start)) " TODO(florian): " r (format-time-string " (%d.%m.%Y, %H:%M)"))
(nt (make-string 2 (string-to-char comment-start)) " NOTE(florian): " r (format-time-string " (%d.%m.%Y, %H:%M)"))
(hack (make-string 2 (string-to-char comment-start)) " HACK(florian): " r (format-time-string " (%d.%m.%Y, %H:%M)"))
(hl (make-string 2 (string-to-char comment-start)) " - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -" n> (make-string 2 (string-to-char comment-start)) " " r n> (make-string 2 (string-to-char comment-start)) " - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -">)

latex-mode
(plc "{\n  \\noindent\n\n  \\ldots\n\n  \\ldots\n\n  \\ldots\n}")
(minipage "\\begin{minipage}[t]{0.5\\linewidth}\n" r> "\n\\end{minipage}")
(mnote "%%\n\\marginnote{%%\n" r> "\n%%\n}\n%%\n")
(snote "%%\n\\sidenote{%%\n" r> "\n%%\n}\n%%\n")
(subcaption "\\begin{subcaptionblock}{0.495\\textwidth}\n\\centering\n" r> "\n\\caption{}\n\\label{}\n\\end{subcaptionblock}%")
(itemize "\\begin{itemize}\n\\item " r> n> "\\end{itemize}")
(frac "\\frac{" p "}{" p "}" q)
(si "\\SI{" p "}{" p "}" q)
(num "\\num{" p "}" q)
(eq "\\begin{IEEEeqnarray}{" p "}" n> "\\label{eq:" p "}" n> q n "\\end{IEEEeqnarray}" >)
(ae "&=&")
(bf "\\textbf{" q "}")
(enum "\\begin{enumerate}[label={(\\arabic*)}]\n\\item " r> n> "\\end{enumerate}")
(sumn "\\sum_{i=1}^{n}")
(sum "\\sum_{" p "}^{", p "}" q)

julia-mode
(inf "(isdefined(Main, :Infiltrator)) && (Main.infiltrate(@__MODULE__, Base.@locals, @__FILE__, @__LINE__))" n>)
(fn "function " p "(" p ")" n r n "end" >)
(for "for " p " in " p n> r n "end" >)
(open "open(" p ", \"w\") do io" n r n "end;" >)
(while "while " p n> r n "end" >)

ess-r-mode
(inf "browser();1" n>)

org-mode
(caption "#+caption: ")
(drawer ":" p ":" n r ":end:")
(begin "#+begin_" (s name) n> r> n "#+end_" name)
(quote "#+begin_quote" n> r> n "#+end_quote")
(sidenote "#+begin_sidenote" n> r> n "#+end_sidenote")
(marginnote "#+begin_marginnote" n> r> n "#+end_marginnote")
(example "#+begin_example" n> r> n "#+end_example")
(center "#+begin_center" n> r> n "#+end_center")
(ascii "#+begin_export ascii" n> r> n "#+end_export")
(html "#+begin_export html" n> r> n "#+end_export")
(latex "#+begin_export latex" n> r> n "#+end_export")
(comment "#+begin_comment" n> r> n "#+end_comment")
(verse "#+begin_verse" n> r> n "#+end_verse")
(src "#+begin_src " q n r n "#+end_src")
(gnuplot "#+begin_src gnuplot :var data=" (p "table") " :file " (p "plot.png") n r n "#+end_src" :post (org-edit-src-code))
(elisp "#+begin_src emacs-lisp" n r n "#+end_src" :post (org-edit-src-code))
(inlsrc "src_" p "{" q "}")
(title "#+title: " p n "#+author: Daniel Mendler" n "#+language: en")

(zkbook "* Reference
#+begin_src bibtex
  @book{" p ",
    author    = {},
    title     = {},
    publisher = {},
    year      = {},
    edition   = {},
    isbn      = {},
  }
#+end_src")
