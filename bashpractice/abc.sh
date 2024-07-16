#!/bin/bash 
 
# check whether user had supplied -h or --help . If yes display usage
if [[ ( $@ == "--help") ||  $@ == "-h" ]]
then 
	echo "Usage: $0 [arguments]"
	exit 0
fi 
 
echo "All good !!!"