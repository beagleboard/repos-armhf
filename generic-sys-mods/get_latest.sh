#!/bin/bash

dl_src () {
	if [ -d ./src/ ] ; then
		rm -rf ./src/
	fi

	git clone git@github.com:beagleboard/bbbio-set-sysconf.git ./src/
}

dl_usr_src () {
	if [ -d ./src/ ] ; then
		rm -rf ./src/
	fi

	#Mirror: https://github.com/beagleboard/customizations
	git clone ssh://git@forgejo.gfnd.rcn-ee.org:222/BeagleBoard.org/usr-customizations.git ./src/
}

copy_all () {
	cp -v ./src/${wfile} ./suite/bookworm/debian/
	cp -v ./src/${wfile} ./suite/noble/debian/
	cp -v ./src/${wfile} ./suite/trixie/debian/
	cp -v ./src/${wfile} ./suite/forky/debian/
}

dl_src

wfile="src/bbbio-set-sysconf" ; copy_all

dl_usr_src

wfile="arm32/usr/bin/beagle-dtb-source" ; copy_all

wfile="arm32/usr/sbin/bb-growpart" ; copy_all
wfile="arm32/usr/sbin/bb-regenerate-ssh-host-keys" ; copy_all
wfile="arm32/usr/sbin/bb-resizefs" ; copy_all
wfile="arm32/usr/sbin/bb-setup-mac-address" ; copy_all
wfile="arm32/usr/sbin/bb-smsc95xx-set-mac-address" ; copy_all

#
