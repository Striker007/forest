#!/usr/bin/env bash
source ./forest.conf
source ./mod_dir.sh
#code of cli_sandbox_destroy.sh

echo "DESTROY sandbox"

sandbox_name="$1"
if [ -z "$sandbox_name" ]; then
	echo "err: sandbox name undefined"
	return 1
fi

return_to_root

container=$(docker ps -a --filter "name=$sandbox_name" -q)
if [ ! -z "$container" ]; then
	sudo docker stop $container
	sleep 3
	sudo docker rm $container
fi

delete  "$conf_dir_main/$sandbox_name"

