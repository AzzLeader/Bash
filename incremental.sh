#!/bin/bash

/!\ Veuillez changer le nommage et le répertoire de stockage des sauvegardes.

# ./incremental.sh -c /chemin/       --> pour sauvegarder
# ./incremental.sh -x                --> pour restaurer la sauvegarde la plus récente



date=$( date +%Y.%m.%d)
origin=`ls $HOME/backup/$2-* | wc -l`
compt=$(( $origin + 1 ))

if [ ! -d "$HOME/backup" ];
then
	mkdir $HOME/backup
fi


if [ $1 == "-c" ]; then

	if [ ! -f "$HOME/backup/$2-$date-1.tar.gz" ];then
		tar zcvf $2-$date-1.tar.gz $2
		mv $2-$date-1.tar.gz $HOME/backup/
		echo "Archive $2-$date-1 créée et déplacée"

	elif [ -f "$HOME/backup/$2-$date-1.tar.gz" ];then

		
		echo "($origin) archive(s) existante(s)"
		
		if [ ! -d "$HOME/tmp" ];
		then
			mkdir $HOME/tmp
			cp $HOME/backup/$2-$date-$origin.tar.gz $HOME/tmp/
			tar -xvf  $HOME/backup/$2-$date-$origin.tar.gz -C $HOME/tmp/
			echo "Parcours des fichiers pour trouver les différences"
		fi
		
		for fic in `ls ./$2/`; do
		comp=`diff -q $HOME/$2/$fic $HOME/tmp/$2/$fic`

			if [ "$comp" = "" ]; then
				echo "Le fichier $fic est identique"	
			else
				echo "Le fichier $fic est différent >> incrémentation"
				cp -f $HOME/$2/$fic $HOME/tmp/$2/	
			fi
		
		done
		cd $HOME/tmp/
		tar zcvf $2-$date-$compt.tar.gz $2
		mv $2-$date-$compt.tar.gz $HOME/backup/
		cd $HOME
		rm -rf $HOME/tmp
		
	fi


elif [ $1 == "-x" ]; then
        mkdir ./$2-$date
	tar -xvf  $HOME/backup/$2-$date-$origin.tar.gz -C ./$2-$date
fi


