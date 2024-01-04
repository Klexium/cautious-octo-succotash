#!/bin/bash
source ./config.cfg
if [ ! -d "$archivepath" ]; then
	echo -e "\033[0;31m[job loader][fatal] impossible de trouver le dossier $archivepath\033[0m"
	exit
fi
for i in "${paths[@]}";do
	if [ -d "$i" ]; then
		echo "[job loader][info] archivage du dossier $i"
	else
		echo -e "\033[1;31m[job loader][erreur] impossible d'archiver le dossier $i car il n'exsite pas \033[0m"
	fi
done
exit
