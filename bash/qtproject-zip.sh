#!/bin/bash
#
# Create a zip archive of the qt project directory with all *.user*
# files removed
#

if [ $# -ne 1 ];
then
    FULLFILE=$0
    FILE="$(basename $FULLFILE)"
    echo "usage:  ${FILE}  qtproject_directory"
    exit 0
fi

DIRNAME=$(echo $1 | sed 's:/*$::')
zip ${DIRNAME}.zip -x '*.user*' -x '*~'  -r ${DIRNAME}
