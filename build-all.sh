#!/bin/bash

check_exitcode() {
ERR=$?
if [ $ERR -ne 0 ] ; then
	echo "Previous playbook failed. Exiting..."
	exit 1
fi
}

##############################################################################
ARGS=$@
echo ARGS: $ARGS

./build-network.sh
check_exitcode

./build-jumpserver.sh
check_exitcode

./build-proxy.sh
check_exitcode

./build-docker-engine.sh
check_exitcode


