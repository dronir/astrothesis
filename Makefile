TEXOUT=output
TEXFLAGS=-output-directory $(TEXOUT) -halt-on-error

default: nobib
	
.phony: all
all: thesis.tex
	mkdir -p output
	pdflatex $(TEXFLAGS) thesis.tex
	bibtex $(TEXOUT)/thesis
	pdflatex $(TEXFLAGS) thesis.tex
	pdflatex $(TEXFLAGS) thesis.tex
	cp $(TEXOUT)/thesis.pdf .

.phony: nobib
nobib: thesis.tex
	mkdir -p output
	pdflatex $(TEXFLAGS) thesis.tex
	pdflatex $(TEXFLAGS) thesis.tex
	cp $(TEXOUT)/thesis.pdf .

.phony: clean
clean:
	rm -rf thesis.pdf
	rm -rf output
