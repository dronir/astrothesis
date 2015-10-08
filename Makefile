NAME=thesis
TEXOUT=output
TEX=pdflatex
TEXFLAGS=-output-directory $(TEXOUT) -halt-on-error

# Default target, build the pdf
default: $(NAME).pdf
	
# Target 'all', compile .tex with BibTeX
all: $(TEXOUT)/lightcurves.bbl $(NAME).pdf
.phony: all

# This forces to run BibTeX
$(TEXOUT)/lightcurves.bbl: $(NAME).tex $(NAME).bib
	mkdir -p $(TEXOUT)
	$(TEX) $(TEXFLAGS) $(NAME).tex
	bibtex $(TEXOUT)/$(NAME)

# Build the pdf by running the typesetter twice
$(NAME).pdf: $(NAME).tex FORCE
	mkdir -p $(TEXOUT)
	$(TEX) $(TEXFLAGS) $(NAME).tex
	$(TEX) $(TEXFLAGS) $(NAME).tex
	cp $(TEXOUT)/$(NAME).pdf .

# Using the empty 'FORCE' as a dependency forces build
FORCE:
.phony: FORCE

clean:
	rm -rf $(NAME).pdf
	rm -rf $(TEXOUT)
	rm -rf $(NAME).aux
	rm -rf $(NAME).log
	rm -rf $(NAME).synctex.gz
.phony: clean
	