#!/bin/bash
source ./config.cfg
if [ $1 = "c" ]; then
	if [ ! -d "$archivepath" ]; then
		echo -e "\033[0;31m[archiver][fatal] imposible de créer l'archive car le dossier n'existe pas!"
		exit
	fi 
	tmstp="$(date '+%Y-%m-%d-%H:%M:%S')"
	path="${archivepath}/${tmstp}.tar"
	echo "$path"
	echo "[archiver][info] création de l'archive vide pour ce jour"
	tar -cvf "$path" /dev/null
	if [ -f "$path" ]; then 
		echo -e "\033[1;32m[archiver][succès] une archive vide a bien été crée"
	else
		echo -e "\033[1;33m[archiver][warning] la création de l'archive n'a pas pu ête vérifié"
	fi
fi
exit
