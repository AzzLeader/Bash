#!/bin/bash

if [ $# -lt 3 ]; then
    read -p "Entrez l'heure: " heure
    read -p "Entrez les minutes  : " minutes
    read -p "Entrez les secondes : " secondes
else
    heure=$1
    minutes=$2
    secondes=$3
fi

while true; do
secondes=$[ $secondes + 1 ]
if [ $secondes -ge 60 ]; then
    secondes=0
    minutes=$[ $minutes + 1 ]
    if [ $minutes -ge 60 ]; then
        minutes=0
        heure=$[ $heure + 1 ]
        if [ $heure -ge 24 ]; then
            heure=0
        fi
    fi
fi

echo "Il est $heure heure $minutes et $secondes secondes"
sleep 1
done

#Le script s'execute sous cette forme : ./horloge.sh
