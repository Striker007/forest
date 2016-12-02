#!/usr/bin/env bash
source ./forest.conf
#Code of helpers.sh

function chek_is_err()
{
	if [ $? != 0 ]; then return 1; fi
}

array_get_element_by_index()
{
 	local index=$((${1} + 0))
    shift
    local array=("${@}")

	if [ -z "$index" ]; then
		echo "err: (arr helper func) index is empty"
    fi

    #TODO check - is array
    ((n_elements=${#array[@]}, max_index=n_elements - 1))

	if [ $index -le $max_index ]; then
		echo "${array[$index]}"
		return 0 
	fi

	echo "err: cant find index"
	return 1		
}