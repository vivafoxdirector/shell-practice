#!/bin/bash

## Java gc 추이를 출력하는 기능 구현
# 기본 gc 추이 가져오는 방법
# > jstat -gcutil ${PID}

PID=$1
INTERVAL=$2

if [[ ${PID} == "" ]];
then
	exit 1
fi
if [[ ${INTERVAL} == "" ]];
then
	INTERVAL=1000
fi

DATE=$(date)
JSTAT=$(jstat -gcutil ${PID} | tail -1)

echo ${DATE} ${JSTAT}
