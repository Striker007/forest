#!/usr/bin/env bash
# Argument = -t test -r server -p password -v
docker=`which docker`

usage()
{
cat << EOF
usage: $0 options

This script run the test1 or test2 over a machine.

COMMANDS:
   -h      Show this message
   -t      Type of  test
   -r 	   Type of server 
   -p      Server root password
   -v      Verbose
EOF
}

TEST=""
SERVER=""
PASSWD=""
VERBOSE=""
OPTIND=1
while getopts ":ht:r:p:v" OPTION
do
     case $OPTION in
         h)
             usage
             exit 1
             ;;
         t)
             TEST=$OPTARG
             ;;
         r)
             SERVER=$OPTARG
             ;;
         p)
             PASSWD=$OPTARG
             ;;
         v)
             VERBOSE=1
             ;;
         ?)
             usage
             exit
             ;;
     esac
done

if [ -z $TEST ] || [ -z $SERVER ]  || [ -z $PASSWD ]
then
	usage
     exit 1
else
   # ./bootstrap.sh
	echo "docker start with next parametr...."$TEST $SERVER $PASSWD
  #${docker} run  -t $SERVER 

fi