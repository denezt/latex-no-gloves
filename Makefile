PRGNAME=example
BUILDS=output_file

all: clean generate archive finalize
	@printf "Done, building document\n"

clean:
	@printf "Removing, $(PRGNAME) '*.aux', '*.pdf', '*.log' if exists\n"
	@find . -type f -name "$(PRGNAME).aux" -delete
	@find . -type f -name "$(PRGNAME).pdf" -delete
	@find . -type f -name "$(PRGNAME).log" -delete
	@find . -type f -name "missfont.log" -delete

generate:
	@printf "Starting, to compile $(PRGNAME).tex to $(PRGNAME).pdf\n"
	@pdflatex $(PRGNAME).tex -interaction=nonstopmode

archive:
	@./archiver.sh $(PRGNAME).pdf

finalize:
	@find . -type f -name "$(PRGNAME).aux" -delete
	@find . -type f -name "$(PRGNAME).pdf" -delete
	@find . -type f -name "$(PRGNAME).log" -delete
	@printf "Finalizing, build...\n"

purge:
	@printf "Purging, previous builds...\n"
	@find . -type d -name $(BUILDS) -delete
