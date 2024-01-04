#!/bin/bash
source ./config.cfg
if [ $1 == "c" ]; then
	if [ ! -d "$(dirname '$2')" ]; then
		echo -e "\033[0;31m[archiver][fatal] imposible de créer l'archive car le dossier n'existe pas!\033[0m"
		exit
	elif [ $# -ne 2 ]; then
		echo -e "\033[0;31m[archiver][fatal] $# arguments donnés attendu 2\033[0m"
		./logger.sh 1 3 "$(dirname '$2')" "$# arguments donnés attendu 2"
		exit
	fi
	echo "[archiver][info] création de l'archive vide pour ce jour"
	./logger.sh 1 0 "$(dirname '$2')" "création de l'archive vide pour ce jour"
	tar -cf "$2" -T /dev/null
	if [ -f "$2" ]; then 
		echo -e "\033[1;32m[archiver][succès] une archive vide a bien été crée\033[0m"
		./logger.sh 1 4 "$(dirname '$2')" "une archive vide a bien été crée"
	else
		echo -e "\033[1;33m[archiver][warning] la création de l'archive n'a pas pu ête vérifié\033[0m"
		./logger.sh 1 1 "$(dirname '$2')" "la création de l'archive n'a pas pu ête vérifié"
	fi
elif [ $1 == "a" ]; then
	if [ $# -ne 3 ]; then
		echo -e "\033[0;31m[archiver][fatal] $# arguments donnés attendu 3\033[0m"
		./logger.sh 1 3 "$(dirname '$2')" "$# arguments donnés attendu 3"
	elif [ ! -d "$archivepath" ]; then
		echo -e "\033[0;31m[archiver][fatal] impossible d'append dans l'archive car le chemin de l'archive n'exsite pas!\033[0m"
	fi
	echo "[archiver][info] ajout de $3 à l'archive $2"
	./logger.sh 1 0 "$(dirname '$2')" "ajout de $3 à l'archive $2"
	tar --append --file=$2 $3
	echo -e "\033[1;32m[archiver][succès] l'item à été ajouté\033[0m"
	./logger.sh 1 4 "$(dirname '$2')" "l'item à été ajouté"
elif [ $1 == "h" ]; then
	echo -e "\033[1;35m[archiver][help] 1/3: il y a forcément au moins deux arguments dans une commande le premier est le détermient:\n[archiver][help] 2/3: c <path archive> crée une archive vide. ./archive.sh c /user/home/Backup/archive.tar\n[archiver][help] 3/3: a <path archive> <path item> append l'item dans l'archive. exemple ./archive.sh a /user/home/Backup/archive.tar /user/home/Musiques\033[0m"
else
	echo -e "\033[0;31m[archiver][fatal] argument $1 inconnu utilisez h pour afficher l'aide\033[0m"
fi
exit
