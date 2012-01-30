TEX := $(wildcard *.tex)
TEXPDF := $(patsubst %.tex,%.pdf,$(TEX))

FIG := $(wildcard *.fig)
FIGPDF := $(patsubst %.fig,%.pdf,$(FIG))

JGRAPH := $(wildcard *.jgraph)
JGRAPHPDF := $(patsubst %.jgraph,%.pdf,$(JGRAPH))

JPG := $(wildcard *.jpg)
JPGPDF := $(patsubst %.jpg,%.pdf,$(JPG))

PNG := $(wildcard *.png)
PNGPDF := $(patsubst %.png,%.pdf,$(PNG))

all:  $(TEXPDF) $(FIGPDF) $(JGRAPHPDF) $(JPGPDF) $(PNGPDF)


%.pdf : %.fig
	 fig2dev -L pdf $*.fig $*.pdf

%.eps : %.tex *.texm 
	latex $*.tex 
	dvips -G0 -E $*.dvi -o $*.eps
	-rm $*.log $*.aux $*.tmp $*.dvi 

%.eps : %.jgraph
	jgraph $*.jgraph >$*.eps

%.pdf : %.eps
	epstopdf $*.eps

%.pdf : %.jpg
	convert $*.jpg $*.pdf

%.pdf : %.png
	convert $*.png $*.pdf

%.pdf : %.gif
	convert $*.gif $*.pdf
