#TEXFILES=abstract.tex  deployment.tex  introduction.tex  paper.tex  results.tex  spack-stacks.tex listing-spec.tex
TEXFILES=paper.tex

all: paper.pdf

paper.pdf : $(TEXFILES) $(IMAGEFILES) bibup
	pdflatex paper

#bibup : paper.bib
bibup :
	pdflatex paper
	#bibtex paper
	pdflatex paper

force : paper.pdf
	pdflatex paper

clean :
	rm -f bibup
	rm -f *.log
	rm -f paper.bbl
	rm -f *.blg
	rm -f paper.pdf
	rm -f slides.pdf
	rm -f *.aux
	rm -f *.nav
	rm -f *.out
	rm -f *.snm
	rm -f *.vrb
	rm -f *.toc

.PHONY: bibup force clean all
