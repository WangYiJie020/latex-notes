BUILD_DIR=./build
AUX_DIR=$(BUILD_DIR)/aux
OUT_DIR=$(BUILD_DIR)/out

$(shell mkdir -p $(OUT_DIR) $(AUX_DIR))

# use latexmk to compile .tex files to .pdf

LATEXMK=latexmk -xelatex -silent

TEX_FILES=$(shell find . -name '*.tex')
PDF_FILES=$(patsubst ./%.tex,$(OUT_DIR)/%.pdf,$(TEX_FILES))

all: $(PDF_FILES)

$(OUT_DIR)/%.pdf: %.tex
	@mkdir -p $(dir $@) $(AUX_DIR)/$(dir $*)
	$(LATEXMK) -output-directory=$(dir $@) -aux-directory=$(AUX_DIR)/$(dir $*) $<

clean:
	rm -rf $(BUILD_DIR)/*

pdfonly: $(PDF_FILES)
	@echo "PDF files generated in $(BUILD_DIR)"
	rm -rf $(AUX_DIR)/*


.PHONY: all clean pdfonly
