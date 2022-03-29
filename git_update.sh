#!/bin/bash
source $HOME/.config/.tianff
set -euo pipefail

myusername=lavendaraphael

cd ${homedir}codes
array_dir=$(ls)
for i in ${array_dir}
do
    echo ------------------------------$i
    cd $i
    git pull
    git add .
    git status
    gitstatus=$(git status)
    if [[ "$gitstatus" == *"committed:"* ]]; then
        git commit -m "auto"
    fi
    gitstatus=$(git status)
    if [[ "$gitstatus" == *"git push"* ]]; then
        myurl=$(git remote -v | tail -n 1 | awk '{print $2}')
        myurl=https://${myusername}@${myurl: 8}
        git push $myurl
        git pull
    fi
    cd ..
done
