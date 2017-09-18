CONDA=miniconda.sh

.PHONY:  clean notebook

OS := $(shell uname)
ifeq ($(OS), Linux)
 	URL := "https://repo.continuum.io/miniconda/Miniconda-latest-Linux-x86_64.sh"
	REQ := requirementsLinux.txt 
else ifeq ($(OS), Darwin)
 	URL := "https://repo.continuum.io/miniconda/Miniconda-latest-MacOSX-x86_64.sh"
	REQ := requirementsMac.txt
endif


$(CONDA):
	curl $(URL) -o $(CONDA) 
	chmod +x $(CONDA)

miniconda: 
	./$(CONDA) -b -p ./miniconda
	./miniconda/bin/conda install -y --file $(REQ)
	
clean:
	rm -rf $(CONDA) miniconda

notebook:	
	miniconda/bin/jupyter notebook
