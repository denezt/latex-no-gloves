#!/bin/sh

mkdir -v "output_file"
[ -e "${1}" ] && mv -v ${1} output_file/
