#!/bin/bash
CONFILE="setmain.md"
cat ${CONFILE} | while read LINE
do
	# retrieve set info
	SETFILE=`echo ${LINE} | awk -F'[,]' '{print $1}'`
	IP=`echo ${LINE} | awk -F'[,]' '{print $2}'`
	PORT=`echo ${LINE} | awk -F'[,]' '{print $3}'`
	OUTFILE=${SETFILE}_new

	OLDIP=`cat ${SETFILE} | grep "<ip>" | sed -e 's/<[^>]*>//g' | awk '{print $1}'`
	OLDPORT=`cat ${SETFILE} | grep "<port>" | sed -e 's/<[^>]*>//g' | awk '{print $1}'`

	if [[ ${OLDIP} = "" || ${OLDPORT} = "" ]] ; then
		echo "Maybe incorrect main.xml..."
		exit 1
	fi

	cat ${SETFILE} | sed -e 's@'$OLDIP'@'$IP'@' | sed -e 's@'$OLDPORT'@'$PORT'@' > ${OUTFILE}
	mv ${OUTFILE} ${SETFILE}
	echo "${SETFILE} ok.."
done
