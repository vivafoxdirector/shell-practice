#!/bin/bash
dirs=$(echo $(ls -d AGENT*/) | sed 's/\///g')
for dir in ${dirs}
do
	cp $1 ./${dir}/properties/
	#rm -rf ./${dir}/loader
done
