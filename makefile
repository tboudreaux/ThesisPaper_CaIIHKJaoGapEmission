LTC="pdflatex"
BTC="bibtex"
NAME="JaoGapCaIIHKRelation"
TFLAGS="-jobname=$(NAME)"
SRC_DIR="."
MAIN_SRC="ms.tex"

ASSET_FILES = $(shell find ./src/ -regex '.*\(tex\|pdf\)$')

default: all

all: pdf

pdf: ./src/$(ASSET_FILE)
	cd src && $(LTC) $(TFLAGS) $(SRC_DIR)/$(MAIN_SRC)
	cd src && $(BTC) $(NAME)
	cd src && $(LTC) $(TFLAGS) $(SRC_DIR)/$(MAIN_SRC)
	cd src && $(LTC) $(TFLAGS) $(SRC_DIR)/$(MAIN_SRC)
	cp src/$(NAME).pdf .
clean:
	-rm $(NAME).blg
	-rm $(NAME).bbl
	-rm $(NAME).aux
	-rm $(NAME).log

ApJ:
	cd $(SRC_DIR) && pubPolish --target ApJ --dest ApJ ./$(MAIN_SRC) && mv ApJ ../
	cd ApJ && $(LTC) $(TFLAGS) $(MAIN_SRC) 
	cd ApJ && $(BTC) $(NAME)
	cd ApJ && $(LTC) $(TFLAGS) $(MAIN_SRC)
	cd ApJ && $(LTC) $(TFLAGS) $(MAIN_SRC)

ArXiv:
	cd $(SRC_DIR) && pubPolish --target ArXiV --dest ArXiV ./$(MAIN_SRC) && mv ArXiv ../
	cd ArXiV && $(LTC) $(TFLAGS) $(MAIN_SRC) 
	cd ArXiV && $(BTC) $(NAME)
	cd ArXiV && $(LTC) $(TFLAGS) $(MAIN_SRC)
	cd ArXiV && $(LTC) $(TFLAGS) $(MAIN_SRC)
