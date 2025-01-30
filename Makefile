# Makefile for compiling a LaTeX document and cleaning up auxiliary files

# Name of the main LaTeX file (without extension)
MAIN = thesis-main

# Compiler
LATEX = pdflatex

# Flags for the compiler
LATEX_FLAGS = -interaction=nonstopmode -halt-on-error

# Auxiliary files to be removed during cleanup
AUX_FILES = *.aux *.log *.out *.toc *.lof *.lol *.lot *.fls *.fdb_latexmk *.synctex.gz

# Default target: compile the PDF
all: $(MAIN).pdf

# Rule to compile the PDF
$(MAIN).pdf: $(MAIN).tex
	$(LATEX) $(LATEX_FLAGS) $(MAIN).tex
	$(LATEX) $(LATEX_FLAGS) $(MAIN).tex

# Clean up auxiliary files
clean:
	rm -f $(AUX_FILES)

# Clean up everything, including the PDF
cleanall: clean
	rm -f $(MAIN).pdf

# Watch for changes in the main LaTeX file and recompile the PDF
watch:
	while true; do \
		make --silent; \
	done

.PHONY: all clean cleanall watch