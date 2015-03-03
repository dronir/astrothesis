TEXFLAGS=-output-directory output -halt-on-error

.phony: all
all: thesis.pdf

thesis.pdf: output/thesis.pdf
	cp output/thesis.pdf .

output/thesis.pdf: thesis.tex
	mkdir -p output
	pdflatex $(TEXFLAGS) thesis.tex

.phony: clean
clean:
	rm -rf thesis.pdf
	rm -rf output
