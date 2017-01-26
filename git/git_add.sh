#!/bin/bash
#git_add.sh


echo "git add -A"
git add -A
echo ""

echo "Commit changes:"
read changes
echo "git commit -am "$changes""
git commit -am "$changes"
echo ""

echo "Branch:"
read branch
echo "git push origin "$branch""
git push origin "$branch"
