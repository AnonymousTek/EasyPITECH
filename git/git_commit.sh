#!/bin/bash
#git_commit.sh

echo "Commit changes:"
read changes
echo "git commit -am "$changes""
git commit -am "$changes"
