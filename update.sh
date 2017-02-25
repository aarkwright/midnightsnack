#!/bin/bash

# Globals
PWD=$(pwd)
SCRIPT_PATH="${HOME}/android/midnightsnack"
BUILD_PATH="${HOME}/android/system"

while read FORK_PATH; do 
	cd ${FORK_PATH}
	echo ${FORK_PATH}
	git pull upstream cm-14.1
	git push github HEAD:cm-14.1
	echo
done < ${SCRIPT_PATH}/tmp_upstreams.update

# Return to initial path
cd $PWD
