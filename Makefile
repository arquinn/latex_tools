OUTPAPERS=$(addsuffix .pdf, ${PAPERNAMES})

ifdef TEXOUTDIR
OUTARG="-outdir=${TEXOUTDIR}"
else
OUTARG=""
endif

testdir=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
export TEXMFHOME=${testdir}/texmf

.PHONY: $(OUTPAPERS) latex_clean

$(OUTPAPERS): %.pdf: %.tex
	latexmk -pdf -pdflatex="yes '' | pdflatex" -use-make ${OUTARG} $<

latex_clean:
	latexmk ${OUTARG} -C
	rm -f ${TEXOUTDIR}/*.bbl

