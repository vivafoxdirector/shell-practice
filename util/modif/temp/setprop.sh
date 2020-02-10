#!/bin/bash
CONFILE="setprop.md"
cat ${CONFILE} | while read LINE
do
	# retrieve set info
	SETFILE=`echo ${LINE} | awk -F'[,]' '{print $1}'`
	IP=`echo ${LINE} | awk -F'[,]' '{print $2}'`
	PORT=`echo ${LINE} | awk -F'[,]' '{print $3}'`
	OUTFILE=${SETFILE}_new

	PROP=`cat ${SETFILE} | grep "server.sub.ip.port" | grep -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | awk -F'[=]' '{print $2}'`

	OLDIP=`echo ${PROP} | awk -F'[:]' '{print $1}'`
	OLDPORT=`echo ${PROP} | awk -F'[:]' '{print $2}'`

	if [[ ${OLDIP} = "" || ${OLDPORT} = "" ]] ; then
		echo "Maybe incorrect main.xml..."
		exit 1
	fi

	cat ${SETFILE} | sed -e 's@'$OLDIP'@'$IP'@' | sed -e 's@'$OLDPORT'@'$PORT'@' > ${OUTFILE}
	mv ${OUTFILE} ${SETFILE}
	echo "${SETFILE} ok.."
done
