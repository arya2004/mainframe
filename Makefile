.PHONY: all clean

COBOL_COMPILER=cobc
PROGRAM=MERGE-SORT-FILES

all: compile

compile:
	$(COBOL_COMPILER) -x -free  source/$(PROGRAM).CBL -o source/$(PROGRAM).exe


clean:
	rm -f $(PROGRAM) OUTPUT.DAT SORTFILE.TMP
