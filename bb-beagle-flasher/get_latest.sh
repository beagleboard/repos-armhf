#!/bin/bash

dl_src () {
	if [ -d ./src/ ] ; then
		rm -rf ./src/
	fi

	git clone https://github.com/beagleboard/customizations ./src/
}

copy_all () {
	cp -v ./src/${wfile} ./suite/noble/debian/

	cp -v ./src/${wfile} ./suite/bookworm/debian/
	cp -v ./src/${wfile} ./suite/trixie/debian/
	cp -v ./src/${wfile} ./suite/forky/debian/
}

dl_src

wfile="arm32/usr/sbin/beagle-flasher" ; copy_all
wfile="arm32/usr/sbin/enable-beagle-flasher" ; copy_all
wfile="arm32/usr/sbin/init-beagle-flasher" ; copy_all
wfile="templates/bbai-emmc-to-microsd" ; copy_all
wfile="templates/bbai-microsd-to-emmc" ; copy_all
wfile="templates/beaglebone-black-emmc-to-microsd" ; copy_all
wfile="templates/beaglebone-black-emmc-to-microsd-fat-swap" ; copy_all
wfile="templates/beaglebone-black-microsd-to-emmc" ; copy_all
wfile="templates/beaglebone-black-microsd-to-emmc-fat-swap" ; copy_all
