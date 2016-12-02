#!/usr/bin/env bash
source ./forest.conf
#Code of mod_text.sh

replace_text() {
	local text="$1"
	local placeholder="$2"
	local value="$3"
	
	echo "$(echo "$text" | sed "s^$placeholder^$value^g")"
}
