#!/bin/bash

# Globals
SCRIPT_PATH="${HOME}/android/midnightsnack"
BUILD_PATH="${HOME}/android/system"


# Get main LineageOS upstreams
echo "[+] Getting LineageOS upstreams..."
awk '/project/ {print $2,$3}' ${BUILD_PATH}/.repo/local_manifests/roomservice.xml | sed -e s/name\=\"aarkwright\\/// -e s/path\=\"// -e s/\"// -e s/\"// | grep -vi proprietary > ${SCRIPT_PATH}/tmp_upstreams.lineage
# Get proprietary TheMuppets upstreams
echo "[+] Getting TheMuppets OP3 proprietary upstreams..."
awk '/project/ {print $2,$3}' ${BUILD_PATH}/.repo/local_manifests/roomservice.xml | sed -e s/name\=\"aarkwright\\/// -e s/path\=\"// -e s/\"// -e s/\"// | grep -i proprietary > ${SCRIPT_PATH}/tmp_upstreams.muppets

echo
# Generate upstreams
echo "[+] Setting upstreams for LineageOS forks"
while read REPO GIT_PATH; do 
	cd ${BUILD_PATH}/${GIT_PATH}
	
	echo "[+] LineageOS/${REPO}"
	if [[ ! $(git remote -v | grep upstream) ]]; then
		git remote add upstream https://github.com/LineageOS/${REPO}
		git remote -v
	else
		echo "[-] Removing old upstream: $(git remote -v | awk '/upstream/ {print $2}' | sort -u)"
		git remote rm upstream
		git remote add upstream https://github.com/LineageOS/${REPO}
		git remote -v
	fi
	echo
done < ~/android/midnightsnack/tmp_upstreams.lineage

echo "[+] Setting upstreams for TheMuppets proprietary forks"
while read REPO GIT_PATH; do 
	cd ${BUILD_PATH}/${GIT_PATH}
	
	echo "[+] LineageOS/${REPO}"
	if [[ ! $(git remote -v | grep upstream) ]]; then
		git remote add upstream https://github.com/TheMuppets/${REPO}
		git remote -v
	else
		echo "[-] Removing old upstream: $(git remote -v | awk '/upstream/ {print $2}' | sort -u)"
		git remote rm upstream
		git remote add upstream https://github.com/TheMuppets/${REPO}
		git remote -v
	fi
	echo
done < ~/android/midnightsnack/tmp_upstreams.muppets

