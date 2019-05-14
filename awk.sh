#!/bin/bash

#Différentes utilisations de Awk avec bash.
#/!\ nécessite l'installation de AWK !!

#On affiche les USERS, le UID et le repertoire.
awk -F":" '{print $1,$3,$6}' /etc/passwd

#On compte le nombre d'utilisateurs
echo "Nombre d'utilisateurs : "
awk '{ nlines++ } END {print nlines}' /etc/passwd

#Taille du rep actif
echo "Somme des tailles des fichiers du rep actif : "
ls -l ./ | awk '{sum+=$5} END {print sum}'

#Taille total fichiers
echo "La taille totale des fichiers en Ko est de :"
ipcs -m | awk '{sum+=$5} {val=sum/1000} END {print val}'
ipcs -m | awk '{sum+=$5} END {sum=sum/1000;print sum}'

#Nombre de fichiers
a=`ipcs -m | awk '{ nlines++ } END {print nlines}'`
b=$(($a - 4 ))
echo "il y a $b fichiers dans la memoire partagee"
