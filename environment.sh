#!/bin/bash
# 2021.08.30
if [ ! -z ${environment+x} ]; then
if [ "$environment" == 'pass' ] ;then
    return
fi
fi
echo "#=========================================================================[environment.sh]"

#-------------------------------------------------------------------------------[dir]
export homedir=`find ~ -maxdepth 3 -name "server.me.sh" -print -quit|xargs dirname`/
export software=${homedir}software/

#-------------------------------------------------------------------------------[python]
# not write '__pycache__' folder
export PYTHONDONTWRITEBYTECODE=1

export PYTHONPATH=$PYTHONPATH:$software/bin

#-------------------------------------------------------------------------------[vim]
export VIMINIT="source ${homedir}/codes/common/vimrc.vim"

#-------------------------------------------------------------------------------[alias]
cdl() {
    cd "${1}";
    ll -a;
}
alias cpi="cp -i"

#-------------------------------------------------------------------------------[shopt]
shopt | grep -q '^direxpand\b' && shopt -s direxpand

shopt -s expand_aliases #启用非交互脚本alias
shopt -s dotglob # 隐藏文件

#-------------------------------------------------------------------------------[color]
export TERM=xterm-256color

#-------------------------------------------------------------------------------[path]
export PATH="$software/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

#-------------------------------------------------------------------------------[stack]
ulimit -s unlimited

echo "#=========================================================================<<<"
environment='pass'

