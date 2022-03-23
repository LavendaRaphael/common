export homedir=`find ~ -maxdepth 3 -name "server.me.sh" -print -quit|xargs dirname`/

source ${homedir}codes/common/environment.sh
source ${homedir}server.me.sh
source ${homedir}codes/research/common/groupenv.sh
source ${homedir}codes/research/202103_XasPtO/local_env.sh
source ${homedir}codes/research/202203_MDWater/local_env.sh
