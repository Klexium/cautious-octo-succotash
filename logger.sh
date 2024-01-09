#!/bin/bash
source ./config.cfg
sources=("loader" "archiver" "logger")
data=("info" "warn" "erreur" "fatal" "succès")
if [ $# -ne 4 ]; then
	echo -e "\033[0;31m[logger][fatal] $# arguments donnés attendu 4\033[0m"
	exit 1
elif [ $1 -lt 0 ] || [ $1 -gt 2 ]; then
	echo -e "\033[0;31m[logger][fatal] $1 n'est pas un émetteur de log reconu\033[0m"
	exit 1
elif [ $1 -lt 0 ] || [ $1 -gt 4 ]; then
        echo -e "\033[0;31m[logger][fatal] $1 n'est pas un émetteur de log reconu\033[0m"
        exit 1
elif [ ! -d $3 ]; then
	echo -e "\033[0;31m[logger][fatal] $3 n'est pas un chemin valide\033[0m"
	exit 1
fi
logpath="$3/archive.log"
if [ ! -f "$logpath" ]; then
	echo "[logger][info] le fichier de logging n'est pas présent création du fichier de logging"
	touch "$logpath"
	./logger.sh 2 0 "$(dirname $logpath)" "création du fichier log"
	if [ -f "$logpath" ]; then
		echo -e "\033[1;32m[logger][sucess] le fichier de logging a été crée\033[0m"
	else
		echo -e "\033[1;33m[logger][warn] la création du fichier de logging n'as pas pu être confirmé\033[0m"
	fi
fi
	if [ "$requests" = true ]; then
	echo -e "\033[0;37m[logger][entry] entrée demandée par ${sources[$1]} pour un(e) ${data[$2]} dans le fichier $logpath\033[0m" 
	fi
	echo "[${sources[$1]}][${data[$2]}]@$(date '+%Y-%m-%d-%H:%M:%S'): $4" >> "$logpath"
exit 0
