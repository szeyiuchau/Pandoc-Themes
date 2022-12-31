#!/bin/bash

build_pdf() {
    fn=$1
    echo "building PDFs with template=${fn}"
#    pandoc -f markdown --template="${fn}" tests/inp.md -o tests/${fn%.tex}.tex
#    xelatex tests/${fn%.tex}.tex
    pandoc --pdf-engine=xelatex -f markdown --template="${fn}" tests/inp.md -o tests/${fn%.tex}.pdf
    pandoc --citeproc --csl=tests/ieee-security-and-privacy.csl \
        --bibliography tests/ref.bib \
        --pdf-engine=xelatex -f markdown \
        --template="${fn}" tests/inp-w-ref.md -o tests/${fn%.tex}-w-ieee-ref.pdf
    pandoc --citeproc --csl=tests/acm-sig-proceedings-long-author-list.csl \
        --bibliography tests/ref.bib \
        --pdf-engine=xelatex -f markdown \
        --template="${fn}" tests/inp-w-ref.md -o tests/${fn%.tex}-w-acm-ref.pdf
}

export -f build_pdf

for fn in *.tex; do
    [ -f "${fn}" ] || continue
    echo "${fn}"
done | xargs -n 1 -P $(nproc) -I {} bash -c 'build_pdf "$@"' _ {}

