BUILD_DIR=./build
AUX_DIR=$(BUILD_DIR)/aux
OUT_DIR=$(BUILD_DIR)/out

$(shell mkdir -p $(OUT_DIR) $(AUX_DIR))

# use latexmk to compile .tex files to .pdf

LATEXMK=latexmk -pdf -output-directory=$(OUT_DIR) -aux-directory=$(AUX_DIR) -silent

TEX_FILES=$(shell find . -name '*.tex')
PDF_FILES=$(patsubst ./%, $(OUT_DIR)/%, $(TEX_FILES:.tex=.pdf))

all: $(PDF_FILES)

$(OUT_DIR)/%.pdf: %.tex
	$(LATEXMK) $<

clean:
	rm -rf $(BUILD_DIR)/*

pdfonly: $(PDF_FILES)
	@echo "PDF files generated in $(BUILD_DIR)"
	rm -rf $(AUX_DIR)/*


.PHONY: all clean pdfonly
