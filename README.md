# Purpose #

This repository is intended to hold files generic to paper writing.  Some files
include:

* full.bib
* Generic Makefile
* Templates?

## Usage ##
This file holds a generic makefile (Makefile), to use that makefile, add this
repository as a submodule of your repository and make a makefile similar to
below:

```bash
PAPERNAMES=paper

TEXOUTDIR=$(abspath out)

.PHONY: all
all: paper.pdf

include latex_tools/Makefile

.PHONY: clean
clean: latex_clean
```

