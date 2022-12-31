#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "$0 <pandoc-template-path>"
    exit
fi

for fn in *.tex; do
    [ -f "${fn}" ] || continue
    ln -i --symbolic "`pwd`/${fn}" "$1/${fn}"
done
