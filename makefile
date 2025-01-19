TEXFILES=paper.tex introduction.tex objectives.tex abstract.tex methods-abstract.tex usecases-abstract.tex discussion.tex

all: paper.pdf

paper.pdf : $(TEXFILES) paper.bbl
	pdflatex paper

paper.bbl : $(TEXFILES) refs.bib
	pdflatex paper
	bibtex paper
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

.PHONY: force clean all
