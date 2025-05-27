#!/bin/bash

dl_src () {
	if [ -d ./src/ ] ; then
		rm -rf ./src/
	fi

	git clone https://openbeagle.org/beagleboard/usr-customizations.git ./src/
}

copy_all () {
	cp -v ./src/${wfile} ./suite/bullseye/debian/
	cp -v ./src/${wfile} ./suite/bookworm/debian/
	cp -v ./src/${wfile} ./suite/noble/debian/
	cp -v ./src/${wfile} ./suite/trixie/debian/
}

dl_src

wfile="arm32/usr/sbin/beagle-flasher" ; copy_all
wfile="arm32/usr/sbin/enable-beagle-flasher" ; copy_all
wfile="arm32/usr/sbin/init-beagle-flasher" ; copy_all
wfile="templates/bbai-emmc-to-microsd" ; copy_all
wfile="templates/bbai-microsd-to-emmc" ; copy_all
wfile="templates/beaglebone-black-emmc-to-microsd" ; copy_all
wfile="templates/beaglebone-black-microsd-to-emmc" ; copy_all
