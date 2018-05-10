#!/bin/bash
dirs=$(echo $(ls -d */) | sed 's/\///g')
for dir in ${dirs}
do
	cp $1 ./${dir}
done
