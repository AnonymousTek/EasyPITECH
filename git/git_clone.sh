#!/bin/bash
#git_clone.sh

echo "Username:"
read user
echo "Repository:"
read depot
echo "git clone git@git.epitech.eu:/"$user"/"$depot""
git clone git@git.epitech.eu:/$user/$depot
