LTC="pdflatex"
BTC="bibtex"
NAME="JaoGapCaIIHKRelation"
TFLAGS="-jobname=$(NAME)"
SRC_DIR="src"
MAIN_SRC="ms.tex"

ASSET_FILES = $(shell find ./src/ -regex '.*\(tex\|pdf\)$')

.PHONY: ApJ ArXiv

default: all

all: pdf

pdf: ./src/$(ASSET_FILE)
	cd $(SRC_DIR) && $(LTC) $(TFLAGS) ./$(MAIN_SRC)
	cd $(SRC_DIR) && $(BTC) $(NAME)
	cd $(SRC_DIR) && $(LTC) $(TFLAGS) ./$(MAIN_SRC)
	cd $(SRC_DIR) && $(LTC) $(TFLAGS) ./$(MAIN_SRC)
	cp $(SRC_DIR)/$(NAME).pdf .
clean:
	-rm $(NAME).blg
	-rm $(NAME).bbl
	-rm $(NAME).aux
	-rm $(NAME).log

ApJ:
	pubPolish --target ApJ --dest ApJ $(SRC_DIR)/$(MAIN_SRC) --force --additional /mnt/p/d/Astronomy/GraduateSchool/Thesis/JaoGapActivity/ExploratoryData/rotationalTable.mrt
	cd ApJ && $(LTC) $(TFLAGS) $(MAIN_SRC) 
	cd ApJ && $(BTC) $(NAME)
	cd ApJ && $(LTC) $(TFLAGS) $(MAIN_SRC)
	cd ApJ && $(LTC) $(TFLAGS) $(MAIN_SRC)
	tar -czvf ApJ.tar.gz ApJ

ArXiv:
	pubPolish --target ArXiv --dest ArXiv $(SRC_DIR)/$(MAIN_SRC) --force --additional /mnt/p/d/Astronomy/GraduateSchool/Thesis/JaoGapActivity/ExploratoryData/rotationalTable.mrt
	cd ApJ && $(LTC) $(TFLAGS) $(MAIN_SRC) 
	cd ApJ && $(BTC) $(NAME)
	cd ApJ && $(LTC) $(TFLAGS) $(MAIN_SRC)
	cd ApJ && $(LTC) $(TFLAGS) $(MAIN_SRC)


