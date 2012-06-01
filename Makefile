DIR_COLOR = ~/Dropbox/work/resume/color
DIR_PRINT = ~/Dropbox/work/resume/print

preview:
	cp resume.tex preview.tex
	# need to render twice, otherwise header won't show
	xelatex preview.tex && xelatex preview.tex && evince preview.pdf
	rm preview.*

all: color print
	evince $(DIR_COLOR)/William\ Ting.pdf
	evince $(DIR_PRINT)/William\ Ting.pdf

color:
	sed "s/\\documentclass\[.*\]/\\documentclass\[\]/" <resume.tex >color.tex
	xelatex color.tex && xelatex color.tex
	cp ./color.pdf $(DIR_COLOR)/William\ Ting.pdf
	cp ./color.pdf ./william_ting_color.pdf
	rm color.*

	@-rm $(DIR_COLOR)/201*.txt
	date > $(DIR_COLOR)/`date +%Y.%m.%d_%T`.txt

print:
	sed "s/\\documentclass\[.*\]/\\documentclass\[print\]/" <resume.tex >print.tex
	xelatex print.tex && xelatex print.tex
	cp ./print.pdf $(DIR_PRINT)/William\ Ting.pdf
	cp ./print.pdf ./william_ting_print.pdf
	rm print.*

	@-rm $(DIR_PRINT)/201*.txt
	date > $(DIR_PRINT)/`date +%Y.%m.%d_%T`.txt
