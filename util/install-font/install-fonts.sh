#!/bin/bash

# find ./ \( -name '*.[o,t]tf' -o -name '*.pcf.gz' \) -type f -print0 | xargs -0 -n1 echo
# time seq 10 | xargs -I % echo % T

source_dir=$(pwd)

find_command="find \"$source_dir\" \( -name '*.[o,t]tf' -or -name '*.pcf.gz' \) -type f -print0"

if [[ $(uname) == 'Linux' ]]; then
	# Linux
	font_dir="$HOME/.local/share/fonts"
	mkdir -p $font_dir
else
	# MacOS
	font_dir="$HOME/Library/Fonts"	
fi

eval $find_command | xargs -0 -I{} echo {}
eval $find_command | xargs -0 -I{} cp {} "$font_dir/"

if command -v fc-cache @>/dev/null ; then
	echo -e "\nResetting font cache, his may take a moment..."
	fc-cache -f $font_dir
fi

echo -e "\nAll fonts have been installed to $font_dir"
