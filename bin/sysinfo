#!/bin/bash

CPU_COUNT=`grep physical\ id /proc/cpuinfo |sort -u|wc -l`
CORE_COUNT=`grep core\ id /proc/cpuinfo |sort -u|wc -l`
CPU_MODEL=
CPU_VENDOR=`grep vendor_id /proc/cpuinfo|awk '{print $3}'|sort -u`
CPU_FREQ=`cat /proc/cpuinfo | grep "cpu MHz" | sort -u|sed 's/[^0-9\.]//g'`
OS_BIT=`uname -m`
KERNEL_VERSION=`uname -rsv`

#These are the distros I can test, don't have others installed
OS=`egrep -i 'red\ hat|suse|centos|ubuntu|debian' /etc/issue`

MEMORY_KB=`grep MemTotal: /proc/meminfo|awk '{ print $2 }'`
MEMORY_MB=`echo $MEMORY_KB / 1024|bc`"M"

if [ $OS_BIT == 'x86_64' ]; then
   OS_BIT="64bit"
else
   OS_BIT="32bit"
fi

if [ $CPU_COUNT == 0 ]; then
   CPU_COUNT=1
   CORE_COUNT=1
fi

if [ $CPU_VENDOR == 'GenuineIntel' ]; then
   CPU_VENDOR="Intel"
   CPU_TYPE=`grep model\ name /proc/cpuinfo|sort -u|awk '{print $5" "$7 $8 $9}'`
elif [ $CPU_VENDOR == 'AuthenticAMD' ]; then
   CPU_VENDOR="AMD"
   CPU_TYPE=`grep model\ name /proc/cpuinfo|sort -u|awk '{print $4 " " $5 " " $7}'`
fi


   echo "CPU COUNT: " $CPU_COUNT
   echo "CORE PER CPU: " $CORE_COUNT
   echo "CPU VENDOR: " $CPU_VENDOR
   echo "CPU Type: " $CPU_TYPE
   echo "Platform: " $OS_BIT
   echo "Operating System: " $OS
   echo "Kernel Version: " $KERNEL_VERSION
   echo "Total Memory: " $MEMORY_MB
