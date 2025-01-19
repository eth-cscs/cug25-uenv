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

pdflatex paper
bibtex paper
pdflatex paper
pdflatex paper
