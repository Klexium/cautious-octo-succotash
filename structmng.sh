#!/bin/bash
source ./config.cfg
path="$archivepath/$(date +%Y)"
if [ -d "$path" ]; then
	path1="$path/$(date +%B)"
	if [ -d "$path1" ]; then
		echo -e "\033[0;32m[struct mananger][fin] la structure est à jour\033[0m"
	else 
		echo "[struct mananger][info] mise à jour de la stucture mois"
		cd "$path"
		mkdir "$(date +%B)"
		echo -e "\033[0;32m[struct mananger][fin] la structure est à jour\033[0m"
	fi
else
	cd "$archivepath"
	echo "[struct mananger][info] mise à jour de l'année"
        mkdir "$(date +%Y)"
	cd "$path"
	mkdir "$(date +%B)"
	echo -e "\033[0;32m[struct mananger][fin] la structure est à jour\033[0m"
fi
exit
