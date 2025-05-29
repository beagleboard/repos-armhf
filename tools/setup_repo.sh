#!/bin/bash -e

DIR="$PWD"
apache_dir="/var/www/html/repos"

setup_repo () {
	echo "${dist}-${suite}"
	if [ ! -d ${apache_dir}/${dist}/dists/${suite}/ ] ; then
		mkdir -p ${apache_dir}/${dist}/conf/
	fi

	echo "Origin: rcn-ee.net" >> ${apache_dir}/${dist}/conf/distributions
	echo "Label: rcn-ee.net" >> ${apache_dir}/${dist}/conf/distributions
	echo "Codename: ${suite}" >> ${apache_dir}/${dist}/conf/distributions
	echo "Architectures: ${archs}" >> ${apache_dir}/${dist}/conf/distributions
	echo "Components: main" >> ${apache_dir}/${dist}/conf/distributions
	echo "UDebComponents: main" >> ${apache_dir}/${dist}/conf/distributions
#	echo "Description: Apt repository for rcn-ee.net" >> ${apache_dir}/${dist}/conf/distributions
	echo "Description: Apt repository for debian.beagleboard.org" >> ${apache_dir}/${dist}/conf/distributions
	echo "SignWith: ${key}" >> ${apache_dir}/${dist}/conf/distributions
	echo "Log: ${apache_dir}/${dist}/log/${suite}.log" >> ${apache_dir}/${dist}/conf/distributions
	echo "" >> ${apache_dir}/${dist}/conf/distributions

	echo "verbose" > ${apache_dir}/${dist}/conf/options
	echo "basedir ${apache_dir}/${dist}" >> ${apache_dir}/${dist}/conf/options
	echo "ask-passphrase" >> ${apache_dir}/${dist}/conf/options

	#53A22F89 key expires: 2015-07-02
	#A4C46402 default on 2015-05-06
	if [ -f ${apache_dir}/${dist}/conf/repos.rcn-ee.net.gpg.key ] ; then
		rm -f ${apache_dir}/${dist}/conf/repos.rcn-ee.net.gpg.key || true
	fi

	cd ${apache_dir}/${dist}/conf/
	gpg --armor --output repos.rcn-ee.net.gpg.key --export ${key}
	cd ${DIR}/

	if [ -f ${apache_dir}/${dist}/conf/repos.rcn-ee.net.2015.gpg.key ] ; then
		rm -f ${apache_dir}/${dist}/conf/repos.rcn-ee.net.2015.gpg.key
	fi

	cd ${apache_dir}/${dist}/conf/
	gpg --armor --output repos.rcn-ee.net.2015.gpg.key --export A4C46402
	cd ${DIR}/

	#for apt-cacher-ng...
	if [ -f ${apache_dir}/${dist}/conf/custom.gpg ] ; then
		rm -f ${apache_dir}/${dist}/conf/custom.gpg
	fi

	cd ${apache_dir}/${dist}/conf/
	gpg --armor --output custom.gpg --export ${key}
	cd ${DIR}/
}

dist="debian"
if [ -f ${apache_dir}/${dist}/conf/distributions ] ; then
	rm -f ${apache_dir}/${dist}/conf/distributions || true
fi

dist="ubuntu"
if [ -f ${apache_dir}/${dist}/conf/distributions ] ; then
	rm -f ${apache_dir}/${dist}/conf/distributions || true
fi

dist="debian-amd64"
if [ -f ${apache_dir}/${dist}/conf/distributions ] ; then
	rm -f ${apache_dir}/${dist}/conf/distributions || true
fi

dist="debian-arm64"
if [ -f ${apache_dir}/${dist}/conf/distributions ] ; then
	rm -f ${apache_dir}/${dist}/conf/distributions || true
fi

dist="debian-riscv64"
if [ -f ${apache_dir}/${dist}/conf/distributions ] ; then
	rm -f ${apache_dir}/${dist}/conf/distributions || true
fi

key="A4C46402"

###Ubuntu (armhf) LTS:

dist="ubuntu"

#14.04
suite="trusty"
archs="armhf source"
setup_repo

#16.04
suite="xenial"
archs="armhf source"
setup_repo

#18.04
suite="bionic"
archs="armhf source"
setup_repo

#20.04
suite="focal"
archs="armhf source"
setup_repo

#22.04
suite="jammy"
archs="armhf source"
setup_repo

#24.04
suite="noble"
archs="armhf source"
setup_repo

###Debian (armhf):

key="A4C46402"

dist="debian"

suite="bullseye"
archs="armhf source"
setup_repo

suite="bookworm"
archs="armhf source"
setup_repo

#key="D59E6DAEAE10AE37"

dist="debian-trixie-armhf"
suite="trixie"
archs="armhf source"
setup_repo

dist="debian-sid-armhf"
suite="sid"
archs="armhf source"
setup_repo

key="A4C46402"

#24.04
#Yes, this is under debian it's to make things easier..
suite="noble"
archs="armhf source"
setup_repo

###Debian (arm64):

key="A4C46402"

dist="debian-arm64"
suite="bullseye"
archs="arm64 source"
setup_repo

suite="bookworm"
archs="arm64 source"
setup_repo

#key="D59E6DAEAE10AE37"

dist="debian-trixie-arm64"
suite="trixie"
archs="arm64 source"
setup_repo

dist="debian-sid-arm64"
suite="sid"
archs="arm64 source"
setup_repo

key="A4C46402"

#20.04
#Yes, this is under debian-arm64 it's to match builds with ros...
suite="focal"
archs="arm64 source"
setup_repo

#22.04
#Yes, this is under debian-arm64, to better sync builds with debian..
suite="jammy"
archs="arm64 source"
setup_repo

#24.04
#Yes, this also under debian-riscv64, to better sync builds with debian..
suite="noble"
archs="arm64 source"
setup_repo

###Debian (riscv64):

dist="debian-riscv64"

#key="D59E6DAEAE10AE37"

dist="debian-trixie-riscv64"
suite="trixie"
archs="riscv64 source"
setup_repo

dist="debian-sid-riscv64"
suite="sid"
archs="riscv64 source"
setup_repo

key="A4C46402"

#24.04
#Yes, this also under debian-riscv64, to better sync builds with debian..
suite="noble"
archs="riscv64 source"
setup_repo

###Debian (amd64):

key="A4C46402"

dist="debian-amd64"
suite="bookworm"
archs="amd64 source"
setup_repo

dist="debian-trixie-amd64"
suite="trixie"
archs="amd64 source"
setup_repo

#
