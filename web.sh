#!/bin/bash

if [ $# -ne 1 ]; then
	echo "[PAGE][fatal] $# arguments donnés attendu 1"
	exit
else if [ ! -d $1 ]; then
	echo "[PAGE][fatal] $1 n'est pas un répertoire"
	exit
fi
echo "<!DOCTYPE html><html><head></head><body><h1>REG OF</h1><p>This is a blank template for a web page.</p></body></html>" > test.html
for years in $1 do
	
