#!/bin/bash

dl_src () {
	if [ -d ./src/ ] ; then
		rm -rf ./src/
	fi

	git clone git@github.com:beagleboard/bbbio-set-sysconf.git ./src/
}

copy_all () {
	cp -v ./src/${wfile} ./suite/bookworm/debian/
	cp -v ./src/${wfile} ./suite/noble/debian/
	cp -v ./src/${wfile} ./suite/trixie/debian/
	cp -v ./src/${wfile} ./suite/forky/debian/
}

dl_src

wfile="src/bbbio-set-sysconf" ; copy_all
