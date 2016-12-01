#!/usr/bin/env bash
source ./forest.conf
#Code of helpers.sh

function chek_is_err()
{
	if [ $? != 0 ]; then return 1; fi
}