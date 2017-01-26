#!/bin/bash
#git_create.sh

login="LOGIN EPITECH : nom_p"
email="EMAIL EPITECH : nom.prenom@epitech.eu"
path_blih="PATH DOSSIER SCRIPT BLIH"

echo "Repository:"
read depot
echo "Permission: Default | Custom: y"
read anwser
case "$anwser" in
        y ) echo "Login:"
	    read user
	    echo "Permission:"
	    read rights
	    echo "blih repository setcal "$depot" "$user" -"$rights""
            python3 $path_blih -u $email repository setacl $depot $user -$rights
	    echo "blih repository getacl "$depot""
	    python3 $path_blih -u $email repository getacl $depot;;
        n ) echo "blih repository setacl "$depot" ramassage-tek -r"
    	    python3 $path_blih -u $email repository setacl $depot ramassage-tek -r
	    echo "blih repository getacl "$depot""
	    python3 $path_blih -u $email repository getacl $depot;;
        * ) echo "blih repository setacl "$depot" ramassage-tek -r"
	    python3 $path_blih -u $email repository setacl $depot ramassage-tek -r
	    echo "blih repository getacl "$depot""
	    python3 $path_blih -u $email repository getacl $depot
	    exit 0;;
esac

