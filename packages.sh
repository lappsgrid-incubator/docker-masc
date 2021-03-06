#!/bin/bash

# Since the .tgz packages are not kept in source control this script can be used
# to download the packages.

SERVER=http://www.anc.org/downloads/docker
PACKAGE_LIST="MASC-3.0.0 MascDataSource_2.2.0"

if [ ! -d packages ] ; then
	mkdir packages
fi

cd packages

case "$1" in
	download)
		for package in $PACKAGE_LIST ; do
			wget $SERVER/$package.tgz
		done
		;;
	update)
		for package in $PACKAGE_LIST ; do
			if [ -e $package.tgz ] ; then
				echo "Skipping $package"
			else
				wget $SERVER/$package.tgz
			fi
		done
		;;
	clean)
		rm *.tgz
		;;
	*)
		echo "Unrecognized command $1"
		;;
esac


