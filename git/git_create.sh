#!/bin/bash
#git_create.sh

login="LOGIN EPITECH : nom_p"
email="EMAIL EPITECH : nom.prenom@epitech.eu"
path_blih="PATH DOSSIER SCRIPT BLIH"

echo "Repository:"
read depot
echo "blih repository create "$depot""
python3 $path_blih -u $email repository create $depot
echo ""

echo "Permission: Default | Custom: y"
read anwser
case "$anwser" in
        y ) echo "Login:"
	    read user
	    echo "Permission:"
	    read rights
	    echo "blih repository setcal "$depot" "$user" -"$rights""
            python3 $path_blih -u $email repository setacl $depot $user -$rights;;
        n ) echo "blih repository setcal "$depot" ramassage-tek -r"
    	    python3 $path_blih -u $email repository setacl $depot ramassage-tek -r;;
        * ) echo "blih repository setcal "$depot" ramassage-tek -r"
	    python3 $path_blih -u $email repository setacl $depot ramassage-tek -r;;
esac
echo ""

echo "git clone git@git.epitech.eu:/"$login"/"$depot""
git clone git@git.epitech.eu:/$login/$depot
