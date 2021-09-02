#!/bin/bash
homedir=`find ~ -maxdepth 3 -name "server.me.sh" -print -quit|xargs dirname`/
set -euo pipefail

myusername=lavendaraphael

cd ${homedir}codes
array_dir=$(ls)
echo $array_dir
for i in ${array_dir}
do
    echo ------------------------------$i
    cd $i
    git pull
    git add .
    git commit -m "auto"
    x=`git status | grep 'git push'`
    echo $x
    if test -n "$x";then
        echo '1 '
        myurl=$(git remote -v | tail -n 1 | awk '{print $2}')
        myurl=https://${myusername}@${myurl: 8}
        git push $myurl
    fi
    pwd
    cd ..
    pwd
done
