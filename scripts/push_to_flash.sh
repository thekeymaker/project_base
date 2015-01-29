#!/bin/sh
#
# push_to_flash.sh
# 
# This script creates a repo at the specified location for further use
#

PROJDIR=${PWD%/*}
PROJNAME=${PROJDIR##*/}

# Check input
if [[ -z "$1" ]]; then
	echo "Missing input! Please provide a location."
else
	PROJREPO=${1}${PROJNAME}.git

	if [ ! -d "$PROJREPO" ]; then
		echo "No Repo. Creating One."
		git init --bare ${PROJREPO} 
	fi

	git remote remove flash
	git remote add flash ${PROJREPO}
	git push flash master
	

fi



echo $PROJREPO

