OUTPAPERS=$(addsuffix .pdf, ${PAPERNAMES})

.PHONY: $(OUTPAPERS) clean

$(OUTPAPERS): %.pdf: %.tex
	latexmk -pdf -pdflatex="yes '' | pdflatex" -use-make $<

latex_clean:
	latexmk -C
	rm -f *.bbl

