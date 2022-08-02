#!/bin/bash
if [ ! -z ${common_environ+x} ]; then
if [ "$common_environ" == 'pass' ] ;then
    return
fi
fi
echo ">>>>----[common/environ.sh]---->>>>"

#-------------------------------------------------------------------------------[shopt]
shopt | grep -q '^direxpand\b' && shopt -s direxpand

shopt -s expand_aliases #启用非交互脚本alias
shopt -s dotglob # 隐藏文件

#-------------------------------------------------------------------------------[stack]
ulimit -s unlimited

echo "<<<<--------<<<<"
common_environ='pass'

