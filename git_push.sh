#!/bin/bash
set -euo pipefail

git pull
git status
git add .
git commit -m "auto"
myurl=$(git remote -v | tail -n 1 | awk '{print $2}')
myusername=lavendaraphael
myurl=https://${myusername}@${myurl: 8}
git push $myurl

