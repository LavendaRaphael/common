#!/bin/bash
# 2021.04.01
if [ ! -z ${environment+x} ]; then
if [ "$environment" == 'pass' ] ;then
    return
fi
fi
echo "--------------------------------------------------------------------------[~/tianff/codes/common/environment.sh]"

#---------------------------------------------[dir]
homedir=`find ~ -maxdepth 3 -name "server.me.sh" -print -quit|xargs dirname`/
echo "homedir="${homedir}

#---------------------------------------------[vim]
export VIMINIT="source ${homedir}/codes/common/vimrc.vim"

#---------------------------------------------[alias]
cdl() {
    cd "${1}";
    ll -a;
}
alias cpi="cp -i"

#---------------------------------------------[dir]
software_bin=${homedir}software/bin/
echo "software_bin="${software_bin}
vasp_pot=${homedir}software/vasp/potpaw_PBE.54/
echo "vasp_pot=${vasp_pot}"

#---------------------------------------------[myserver]
source ${homedir}server.me.sh

#---------------------------------------------[jobsub]
if [ "$mycluster" = "qsub" ]; then
    alias jobsub="qsub"
    alias jobkill="qdel"
elif [ "$mycluster" = "sbatch" ]; then
    alias jobsub="sbatch <"
    alias jobkill="scancel"
elif [ "$mycluster" = "bsub" ]; then
    alias jobsub="bsub <"
    alias jobkill="bkill"
elif [ "$mycluster" = "none" ]; then
    echo "none"
else
    echo "ERROR: 'mycluster' not exist!"
    exit
fi

#---------------------------------------------[shopt]
if [ "$myserver" != "SHTU" ]; then
    shopt -s direxpand #启用目录变量tab扩展
fi

shopt -s expand_aliases #启用非交互脚本alias
shopt -s dotglob # 隐藏文件


environment='pass'
echo "========================================================================="
