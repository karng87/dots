SRCS = $(notdir $(shell find . -regextype posix-extended -regex ".*\.tex$$" -and -not -regex '.*(\.git|pack)/.*'))

TARGETS = $(patsubst %.tex,build/%.pdf, $(SRCS))

TEX =	pdflatex
TEXJ =	pdflatex --jobname=

.PHONEY: all clean run

all: $(TARGETS)

build/%.pdf: %.tex
		pdflatex --jobname=$(patsubst %.tex,build/%,$<) $<

pdf :
		@nohup zathura build/

clean:
		rm $(shell find . -regextype posix-extended -regex '.*\.(hi|o|out|aux|log|toc|nav|snm|lot|lof)$$' -and -not -regex '.*(\.git|pack)/.*')

