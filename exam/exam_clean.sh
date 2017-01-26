path_exam="PATH DOSSIER EXAM"
email="ADRESSE EMAIL EPITECH"

cd $path_exam
find . | xargs rm
touch token
chmod a+x token
cd rendu
echo $email > auteur
