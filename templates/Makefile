
all: main.pdf

main.pdf: main.tex ../*tex ../tex/*tex ../tex/*bib
	pdfcslatex main.tex
	bibtex main
	pdfcslatex main.tex
	pdfcslatex main.tex
	pdfcslatex main.tex
