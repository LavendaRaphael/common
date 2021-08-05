#!/bin/bash
set -euo pipefail

  file=(CHG CHGCAR CONTCAR DOSCAR EIGENVAL exts.dat fe.dat IBZKPT INCAR KPOINTS mep.eps movie movie.vasp neb.dat nebef.dat OSZICAR OUTCAR PCDAT POSCAR POSCAR.vasp POSCAR.xyz POTCAR PROCAR REPORT spline.dat stdout STOPCAR tff\* vaspgr vasprun.xml vasp.log vdw_kernel.bindat WAVECAR XDATCAR \*_sub.sh)
# mode=(0   0      0       0      0        0        0      0      0     0       0       0     0          0       0         0       0      0     0      0           0          0      0      0      0          0      0       0     0      0           0        0                 0       0       0       ) # all
  mode=(0   0      1       0      0        0        0      0      1     1       0       0     0          0       0         0       0      0     1      0           0          0      0      0      0          1      0       0     0      0           1        0                 0       0       0       ) # posopt

j=0
for x in ${mode[@]}
do
    if [ "$x" == "0" ]
    then
        rm -rf ${file[$j]}
        rm -rf 0*/${file[$j]}
        #rm -rf */${file[$j]}
    else
        echo "save $j ${file[$j]}"
    fi
    j=$((j+1))
done
