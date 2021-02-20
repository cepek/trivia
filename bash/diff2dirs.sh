#!/bin/bash

# run from github qgama repository

OPTS="";
for opt in "$@"
do
    OPTS="${OPTS}  $opt"
done

compare() {
    echo "  " "$1" " "

    for i in `find -name  "$1" | grep -v ./build | grep -v ./gama/`;
    do
	diff ${OPTS} $i ../gama-qt/rw/$i;  # relative path to GNU git repository
    done
}

echo
echo "Finding differences for"
compare "*.cpp"
compare "*.h"
compare "*.txt"
compare "*.md"
compare '*.gkf'
compare "*.dox"
compare "*.html"
compare "*.sql"
compare "README*"
compare "Doxy*"
compare "ChangeLog*"
echo
