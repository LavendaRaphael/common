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

gotocode=${homedir}codes/groupcodes/202103_XasPtO/
echo "gotocode="$gotocode

gotowork_1=${homedir}group/202103_XasPtO/server/Pt-111_O_vac/Pt-111a4b4c4_O4_vac15/
echo "gotowork_1=$gotowork_1"

gotowork_2=${homedir}group/202103_XasPtO/server/Pt-110_O_vac/Pt-110a12b2c4.5_O22_vac15/qe_hch_scf/
echo "gotowork_2=$gotowork_2"

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
vasp_pot=${homedir}software/potpaw_PBE.54/
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
shopt | grep -q '^direxpand\b' && shopt -s direxpand

shopt -s expand_aliases #启用非交互脚本alias
shopt -s dotglob # 隐藏文件


environment='pass'
echo "========================================================================="
