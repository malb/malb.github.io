EMACS=emacs
EMACSFLAGS=--batch -Q -l org-export-init.el
LATEXMK=latexmk
LATEXMKFLAGS=-xelatex
PANDOC=pandoc
PANDOCFLAGS=-s --bibliography local.bib --filter pandoc-citeproc --mathjax --csl acm-sig-proceedings.csl

%.docx: %.tex
	$(PANDOC) $(PANDOCFLAGS) -t docx -o $@ $<

%.pdf: %.tex
	$(LATEXMK) $(LATEXMKFLAGS) $<

%.tex: %.org
	$(EMACS) $(EMACSFLAGS) $< -f org-latex-export-to-latex

%.html: %.org
	$(EMACS) $(EMACSFLAGS) $< -f org-html-export-to-html

clean:
	rm -f *.bbl *.aux *.out *.synctex.gz *.log *.run.xml *.blg *-blx.bib *.fdb_latexmk *.fls *.toc

.PHONY: clean all
.PRECIOUS: %.tex
