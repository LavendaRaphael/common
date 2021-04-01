#!/bin/bash
homedir=`find ~ -name 'server.me.sh'|xargs dirname`/
source ${homedir}codes/common/environment.sh
set -euo pipefail

jobname=test
ncore=$[${maxppn}*3]
source ${homedir}codes/common/sub_head.sh
#========================================[main script]
cat >> ${jobname}.sh<<eof
mpirun ${software_bin}intelmpi_test.x > nodetest.log

echo "TotalTime \$((\${SECONDS} / 60)) m \$((\${SECONDS} % 60)) s."
eof

if true;then
    jobsub ${jobname}.sh
fi
