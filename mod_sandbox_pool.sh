#!/usr/bin/env bash
source ./forest.conf
#Code of mod_sandbox_pool.sh

check_sandbox_name() {
	local sandbox_name="$1"
	#local username="$2"
	if [ -z "$conf_sandboxes_pool" ]; then
		echo "err: conf, sandboxes pool is empty"
    fi

    ((n_elements=${#conf_sandboxes_pool[@]}, max_index=n_elements - 1))

	for ((i = 0; i <= max_index; i++)); do
		if [ "$sandbox_name" == "${conf_sandboxes_pool[i]}" ]; then
			return 0 
		fi
	done

	echo "err: cant find sandbox name in sandbox conf pool"
	return 1		
}
