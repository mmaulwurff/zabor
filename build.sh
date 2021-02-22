#!/bin/bash

set -e

mkdir -p build

filename=build/zabor-$(git describe --abbrev=0 --tags).pk3

rm  -f $filename
zip -R $filename "*.md" "*.txt" "*.zs"
gzdoom $filename "$@"
