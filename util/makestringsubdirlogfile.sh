#!/bin/bash

# 특정파일을 가지고 있는 
# 디렉토리명과 특정파일 경로를 
# 함께 출력하는 쉘 스크립트
#
# * 출력방법
# [디렉토리명]|[절대경로]
#
# * 기본 구분자: |
#
# 예시)
# A1|/temp/A1/test.log
# A2|/temp/A2/test.log
# ...
#
# * 입력1
# - 경로 입력
# - 파일명

# * 참고Shell
# ls -d /home/foxdirector/git/shellscript/temp/*/ | sed -e "s/\/home\/foxdirector\/git\/shellscript\/temp//g" -e "s/\///g"
# for D in /home/foxdirector/git/shellscript/temp/*;do echo ${D};done
# echo ${subd} | sed 's/.$//g'


# 1. 경로 입력으로 서브 디렉토리 출력

#if test -f $1
#subdirnames=()

#function test_init () {
test_init () {
	if [ -d "./test1" ];
	then
		rm -rf test1
	fi
	mkdir test1
	mkdir test1/A1 test1/A2 test1/A3 test1/A4
	touch test1/A1/app.log
	touch test1/A2/app.log
	touch test1/A3/app.log
	touch test1/A4/app.log
}

test_run () {
	result=""
	count=0
	if [ -d $1 ];
	then
		subdirs=$(echo $(ls -d $1/*/))
		for subd in ${subdirs};do
			if [ -d ${subd} ];
			then
				# subname=$(echo ${subd} | sed 's/.$//g' | gawk -F "/" '{print $NF}')
				subname=$(echo ${subd} | sed 's/.$//g' | awk -F "/" '{print $NF}')
				filename="${subd}$2"
				if [ -f ${filename} ];
				then
					result+="${subname}|${filename},"
					count=`expr $count + 1`
				else
					echo "${filename} is not file"
				fi
			fi
		done
		echo "count: ${count}"
		echo ${result} | sed 's/.$//g'
	
		#for e in ${subdirnames[@]};do
		#	echo ${e}
		#done
	
		#dirs=$(echo $(ls -d $1/*/) | sed -e "s/$1//g")
		#echo dirs
	fi
}

test_init

# for TEST
# test_run [SubDirectory] [filename]
# ex) test_run /test app.log
test_run $1 $2
