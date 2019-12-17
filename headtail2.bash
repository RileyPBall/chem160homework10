#!/bin/bash
if [ ! -f $1 ]; then
	echo "No file found"
	exit 1
fi
intregex='^[0-9]+$'
if ! [[ $2 =~ $intregex ]]; then
	echo "Second arguement must be an integer"
	exit 1
fi
for i in $1
do
n=$(wc -l $i)
done
echo "$n"
if [ $# -eq 3 ]; then
	if [[ $2 -gt $n ]] || [[ $3 -gt $n ]]; then
	echo "File too short for specified lines"
	exit 1
	fi
	if ! [[  $3 =~ $intregex ]]; then
	echo "Third arguement must be an integer"
	exit 1
	else
	echo "Head"
	head -n $2 $1
	echo "Tail"
	tail -n $3 $1
	fi
else
echo "Head"
head -n $2 $1
echo "Tail"
tail -n $2 $1
fi
