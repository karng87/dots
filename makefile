#OBJ = haskell
#OBJ = template
#OBJ = beamer
OBJ = moderncv
DIR = build
SRC = ${OBJ}.tex
TARGET = ${DIR}/${OBJ}.pdf

.phoney: all clean run

all: ${TARGET}

${TARGET}: ${SRC}
	pdflatex --jobname=${DIR}/${OBJ} $< 

clean:
	rm ${DIR}/${OBJ}.aux ${DIR}/${OBJ}.out ${DIR}/${OBJ}.log ${DIR}/${OBJ}.pdf

run:
	zathura ${TARGET}
