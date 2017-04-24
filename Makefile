OUTPAPERS=$(addsuffix .pdf, ${PAPERNAMES})

testdir=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
export TEXMFHOME=${testdir}/texmf

.PHONY: $(OUTPAPERS) latex_clean

$(OUTPAPERS): %.pdf: %.tex
	latexmk -pdf -pdflatex="yes '' | pdflatex" -use-make $<

latex_clean:
	latexmk -C
	rm -f *.bbl
	@echo "texmfhome is: ${TEXMFHOME}"

