##################################################################
# Makefile for LaTeX
##################################################################
TEX:=$(shell ls *.tex)
FILES = *.tex Makefile *.bst *.pdf *.bib *.sh
FOLDER=./home/saul/Insync/sauld@cimat.mx/$\
Google\ Drive/UNISON/Ponencias/2022/xxxii-semana-unison-2022/ProbablilityWorkshop
ARCHIVELIST = archive.txt
BIBTEXSRCS := $(shell sh biblio.sh)
BIBTEXSRCSLIST += $(BIBTEXSRCS)
OTHER = *~ *.aux *.dvi *.toc *.bbl *.blg *.out *.thm *.ps *.idx *.ilg *.ind \
*.tdo *.pdf *.tar.gz *.log *.spl *.synctex.gz
NAMETAR1:= $(shell date '+%Y%b%d_%H_%M')
NAMETAR = "$(NAMETAR1)-BeamerSemana_xxxii-talk_PW.tar.gz"
NAMETARTEX = "$(NAMETAR1)-BeamerSemana_xxxii_PW.tar.gz"

pdflatex: main.tex biblio.sh
	/usr/local/texlive/2022/bin/x86_64-linux/pdflatex --synctex=1 \
	-interaction=nonstopmode main.tex
	/usr/local/texlive/2022/bin/x86_64-linux/pdflatex --synctex=1 \
	-interaction=nonstopmode main.tex
	/usr/local/texlive/2022/bin/x86_64-linux/pdflatex --synctex=1 \
	-interaction=nonstopmode main.tex
	sh biblio.sh
	/usr/local/texlive/2022/bin/x86_64-linux/pdflatex --synctex=1 \
	-interaction=nonstopmode main.tex
	/usr/local/texlive/2022/bin/x86_64-linux/pdflatex --synctex=1 \
	-interaction=nonstopmode main.tex

bib: biblio.sh
	sh biblio.sh

clean:
	rm -f $(OTHER)

tar:
	tar -cvf $(NAMETAR) -T $(FILES)

zip:
	tar -cvf $(NAMETAR) -T $(FILES)
