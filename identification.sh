#!/bin/bash

#script d'identification des objets
# Ce script s'execute comme ceci :  ./identification.sh /chemin/

echo listage des objets enfants

a=0
b=0
c=0

cd $1
for x in `ls`;
do
echo $x;
if [ -d $x ]; then
	let "a++"
elif [ -x $x ]; then
	let "b++"
elif [ -f $x ]; then
	let "c++"
fi
done
echo "Il y a $a dossiers"
echo "Il y a $b fichiers exécutables"
echo "Il y a $c fichiers normaux"

cd ..

exit 0
