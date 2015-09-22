TEXOUT=output
TEXFLAGS=-output-directory $(TEXOUT) -halt-on-error

default: nobib
	
.phony: all
all: thesis.tex thesis.bib
	mkdir -p $(TEXOUT)
	pdflatex $(TEXFLAGS) thesis.tex
	bibtex $(TEXOUT)/thesis
	pdflatex $(TEXFLAGS) thesis.tex
	pdflatex $(TEXFLAGS) thesis.tex
	cp $(TEXOUT)/thesis.pdf .

.phony: nobib
nobib: thesis.tex
	mkdir -p $(TEXOUT)
	pdflatex $(TEXFLAGS) thesis.tex
	pdflatex $(TEXFLAGS) thesis.tex
	cp $(TEXOUT)/thesis.pdf .

.phony: clean
clean:
	rm -rf thesis.pdf
	rm -rf $(TEXOUT)
