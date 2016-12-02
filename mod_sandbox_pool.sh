#!/usr/bin/env bash
source ./forest.conf
#Code of mod_sandbox_pool.sh

check_sandbox_name() {
	local sandbox_name="$1"
	#local username="$2"
	if [ -z "$conf_sandboxes_name_pool" ]; then
		echo "err: conf, sandboxes pool is empty"
    fi

    #TODO check - is array
    ((n_elements=${#conf_sandboxes_name_pool[@]}, max_index=n_elements - 1))

	for ((i = 0; i <= max_index; i++)); do
		if [ "$sandbox_name" == "${conf_sandboxes_name_pool[i]}" ]; then
			echo "$i"
			return 0 
		fi
	done

	echo "err: cant find sandbox name in sandbox conf pool"
	return 1		
}

sandbox_get_ip_by_name()
{
	local sandbox_name="$1"
	local index=$(check_sandbox_name "$sandbox_name")

	echo $(array_get_element_by_index $index "${conf_sandboxes_ip_pool[@]}")
    chek_is_err
}
