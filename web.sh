#!/bin/bash
source ./config.cfg
#if [ $# -ne 1 ]; then
#	echo "[PAGE][fatal] $# arguments donnés attendu 1"
#	exit
#else if [ ! -d $1 ]; then
##	echo "[PAGE][fatal] $1 n'est pas un répertoire"
#	exit
#fi
echo -e "<!DOCTYPE html><html><head></head><body><h1>reg of <a href=\"$archivepath\">$archivepath</a></h1>" > list.html
for years in "$archivepath"/*; do
	echo -e "<h2><a href=\"$years\">$(basename $years)</a></h2>" >> list.html
	echo "<ul>" >> list.html
	for months in "$years"/*; do
		echo -e "<li><a href=\"$months\">$(basename $months)</a></li>" >> list.html
		echo "<ul>" >> list.html
		for files in "$months"/*; do
			echo "<li><a href=\"$files\">$(basename $files)</a></li>" >> list.html
		done
		echo "</ul>" >> list.html
	done
	echo "</ul>" >> list.html
done
exit
