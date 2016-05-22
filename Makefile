all: out
	pdflatex -output-directory out -halt-on-error -file-line-error main.tex && pdflatex -output-directory out -halt-on-error -file-line-error main.tex

out:
	mkdir -p out

one:
	pdflatex -output-directory out -halt-on-error -file-line-error main.tex


clean:
	find . -name "*~" -delete
	rm -rf out/*
