#!/bin/bash

# Ce script permet :
#  - listage des utilisateurs
#  - recherche d'un utilisateur par nom ou UID
#  - recherche d'un UID par un nom d'utilisateur


# Partie de stockage des fonctions

#Menu n°1
function f1()
{
	echo -n "Nom à vérifier :"
	read nom
	a=`grep "$nom:" /etc/passwd`
	if [ -n "$a" ] 
	then
		echo ">> L'user $nom existe "
	else
		echo ">> L'user $nom existe pas"
	fi
	echo ">> Appuyer sur RETURN  pour avancer"
	read
}

#Menu n°2
function f2()
{
	echo -n "Nom du user à chercher ? : "
	read nom 
        b=`grep "$nom:" /etc/passwd |cut -d ':' -f 3`
	echo -e ">> $b \n >> Appuyer sur RETURN pour avancer"
	read
}

#Appel des fonctions

void=''

while [ "$void" != "q" ]
do
	clear
	echo "1 >-<  Vérifier l'existence d'un utilisateur"
	echo "2 >-<  Connaître l'UID d'un utilisateur"
	echo "q >-<  Quitter"
	echo -en "\n Menu ? "
	read void
	
	if [ "$void"  ==  1 ] ; then 
		f1
	elif [ "$void" ==  2 ] ; then 
		f2
	fi
done

exit 0
