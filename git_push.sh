#!/bin/bash
set -euo pipefail

myusername=lavendaraphael


git pull
git add .
git commit -m "auto"

if test -z "$(git status | grep 'git push')"
then
    exit
fi 

myurl=$(git remote -v | tail -n 1 | awk '{print $2}')
myurl=https://${myusername}@${myurl: 8}
git push $myurl

