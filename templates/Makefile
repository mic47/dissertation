
all: main.pdf

main.pdf: main.tex ../*tex ../tex/*tex ../tex/*bib ../figures/*tex
	pdflatex main.tex
	bibtex main
	pdflatex main.tex
	pdflatex main.tex
	pdflatex main.tex
	../reload_acrobat.sh
