#!/usr/bin/env bash
source ./forest.conf
source ./mod_dir.sh
#Code of cli_forest.sh

sandbox_name="$1"
if [ -z "$sandbox_name" ]; then
	echo "err: sandbox name undefined"
	return 1
fi

code_ver="$2"
if [ -z "$code_ver" ]; then
	code_ver="master"
fi

# garbage collector =)
function cleanup()
{
	./cli_sandbox_destroy.sh "$sandbox_name"
	return_to_root 
	delete "$sandbox_name"
}
trap cleanup SIGHUP SIGINT SIGTERM

# start
./cli_sandbox_start.sh "$sandbox_name" "$code_ver"

if [ $? != 0 ]; then
	echo "err: something going wrong"
fi

echo "done"

