#!/usr/bin/env bash

echo "\$0 is the script itself: $0"


while getopts :u:p:ab option; do
	case $option in
		u) user=$OPTARG;;
		p) pass=$OPTARG;;
		a) echo "Got the a flag.";;
		b) echo "Got the b flag.";;
		?) echo "ehm.. I don't know $OPTARG";;
	esac
done

echo "user: $user / password: $pass"
echo "There are $# arguments given:"

declare -i c=1
for i in $@
do
	echo "$c: $i"
	((c++))
done

