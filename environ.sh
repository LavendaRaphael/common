#!/bin/bash
# 2021.08.30
if [ ! -z ${common_environ+x} ]; then
if [ "$common_environ" == 'pass' ] ;then
    return
fi
fi
echo ">>>>----[common/environ.sh]---->>>>"

#-------------------------------------------------------------------------------[screen]
export SCREENDIR=$homedir/.screen

#-------------------------------------------------------------------------------[python]
export PYTHONPATH=${homedir}/lib:$PYTHONPATH

#-------------------------------------------------------------------------------[vim]
export VIMINIT="source ${homedir}/codes/common/vimrc.vim"

#-------------------------------------------------------------------------------[alias]
cdl() {
    cd "${1}";
    ll -a;
}
alias cpi="cp -i"
alias rmi="rm -Iv"
#-------------------------------------------------------------------------------[shopt]
shopt | grep -q '^direxpand\b' && shopt -s direxpand

shopt -s expand_aliases #启用非交互脚本alias
shopt -s dotglob # 隐藏文件

#-------------------------------------------------------------------------------[color]
export TERM=xterm-256color

#-------------------------------------------------------------------------------[path]
export PATH="${homedir}/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export LIBRARY_PATH="$homedir/lib:$LIBRARY_PATH"
export LD_LIBRARY_PATH="$homedir/lib:$LD_LIBRARY_PATH"
export PKG_CONFIG_PATH="$homedir/lib/pkgconfig:$PKG_CONFIG_PATH"
export LIBRARY_PATH="$homedir/lib64:$LIBRARY_PATH"
export LD_LIBRARY_PATH="$homedir/lib64:$LD_LIBRARY_PATH"
export PKG_CONFIG_PATH="$homedir/lib64/pkgconfig:$PKG_CONFIG_PATH"
export CPATH="$homedir/include:$CPATH"

#-------------------------------------------------------------------------------[stack]
ulimit -s unlimited

echo "<<<<--------<<<<"
common_environ='pass'

