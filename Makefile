OUTPAPERS=$(addsuffix .pdf, ${PAPERNAMES})

ifdef TEXOUTDIR
OUTARG="-outdir=${TEXOUTDIR}"
else
OUTARG=
endif

#testdir=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
#export TEXMFHOME:=${TEXMFHOME}:${testdir}/texmf

.PHONY: $(OUTPAPERS) latex_clean

$(OUTPAPERS): %.pdf: %.tex
	echo "TEXMFHOME: ${TEXMFHOME}"
	latexmk -pdf -pdflatex="yes '' | pdflatex" -use-make ${OUTARG} $<

latex_clean:
	latexmk ${OUTARG} -pdf -pdflatex="pdflatex -interaction=nonstopmode" -use-make -C
	rm -f ${TEXOUTDIR}/*.bbl

