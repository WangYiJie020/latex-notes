BUILD_DIR=./build
AUX_DIR=$(BUILD_DIR)/aux
OUT_DIR=$(BUILD_DIR)/out

$(shell mkdir -p $(OUT_DIR) $(AUX_DIR))

# use latexmk to compile .tex files to .pdf

LATEXMK=latexmk -xelatex -silent
LATEXMK_FORCE=latexmk -xelatex -silent -f

TEX_FILES=$(shell find . -name '*.tex')
PDF_FILES=$(patsubst ./%.tex,$(OUT_DIR)/%.pdf,$(TEX_FILES))

all: $(PDF_FILES)

ci-pdf: LATEXMK=$(LATEXMK_FORCE)
ci-pdf: ALLOW_LATEX_ERRORS=1
ci-pdf: $(PDF_FILES)
	@echo "PDF files generated in $(OUT_DIR)"

$(OUT_DIR)/%.pdf: %.tex
	@mkdir -p $(dir $@) $(AUX_DIR)/$(dir $*)
	$(LATEXMK) -output-directory=$(dir $@) -aux-directory=$(AUX_DIR)/$(dir $*) $< $(if $(ALLOW_LATEX_ERRORS),|| test -f $@)

clean:
	rm -rf $(BUILD_DIR)/*

pdfonly: $(PDF_FILES)
	@echo "PDF files generated in $(BUILD_DIR)"
	rm -rf $(AUX_DIR)/*


.PHONY: all clean pdfonly ci-pdf
