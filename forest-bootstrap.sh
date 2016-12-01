#!/usr/bin/env bash
source ./forest.conf
#Code of bootstrap.sh

# call arguments verbatim:
if [ ! -z $1 ]; then $@; fi
