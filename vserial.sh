#!/bin/bash

if [ $1 == "-h" ]
then
	echo "Usage: ./vserial.sh iboot.img4"
	echo "Ensure ipwndfu and irecovery is in current dir!"
	exit 1
fi


if [ -f "$1" ]; then
    echo "iBoot: $1 Exists."

    if [ -f "ipwndfu" ]; then
    echo "iPWNDFU: Exists."

		if [ -f "irecovery" ]; then
		echo "iRECOVERY: Exists."
		echo "Entering PWNED-DFU"
		./ipwndfu -p
		sleep 3
		echo "Patching Bootchain (Booting Unsigned Image)"
		./ipwndfu --patch
		echo "Sending iBoot"
		sleep 3
		./irecovery -f $1
		echo "Sending iBoot"
		sleep 5
		./irecovery -f $1
		echo "\n You Now Have 15 Seconds To Unplug & Replug Your iOS Device"
		sleep 15
		printf 'setenv boot-args usbserial=enabled\nsaveenv\n/exit\n' | ./irecovery -s
		sleep 3
		printf 'setenv boot-args usbserial=enabled\nsaveenv\n/exit\n' | ./irecovery -s
		sleep 2
		printf 'setenv boot-args usbserial=enabled\nsaveenv\n/exit\n' | ./irecovery -s
		echo "DONE!"

		else 
		echo "iRECOVERY: is NOT in current directory."
		exit 1
		fi
	else 
    echo "iPWNDFU: is NOT in current directory."
    exit 1
	fi
else 
    echo "iBoot: is NOT in current directory."
fi