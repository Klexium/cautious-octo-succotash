#!/bin/bash
source ./config.cfg
if [ ! -d "$archivepath" ]; then
	echo -e "\033[0;31m[job loader][fatal] impossible de trouver le dossier $archivepath\033[0m"
	exit
fi
echo "[job loader][info] mise à jour de la structure"
./structmng.sh
tmstp="$(date '+%Y-%m-%d-%H:%M:%S')"
arch="${archivepath}/$(date +%Y)/$(date +%B)/${tmstp}.tar"
path=$(dirname $arch)
echo -e "\033[1;34m[job loader][job started] début de la tache d'archivage\033[0m"
./logger.sh 0 0 "$path" "début de la tache d'archivage"
echo "[job loader][info] envoi de la tâche de création d'archive"
./logger.sh 0 0 "$path" "envoi de la tâche de création d'archive"
./archive.sh c "$arch"
for i in "${paths[@]}";do
	if [ -d "$i" ]; then
		echo "[job loader][info] archivage du dossier $i"
		./logger.sh 0 0 "$path" "archivage du dossier $i"
		echo "[job loader][info] envoi de la tâche d'archivage"
		./archive.sh a "$arch" "$i"
	else
		echo -e "\033[1;31m[job loader][erreur] impossible d'archiver le dossier $i car il n'exsiste pas \033[0m"
		./logger.sh 0 2 "$path" "impossible d'archiver le dossier $i car il n'exsiste pas"
	fi
done
echo -e "\033[0;32m[job loader][fin] tâche achevé\033[0m"
./logger.sh 0 4 "$path" "tâche achevé"
exit
