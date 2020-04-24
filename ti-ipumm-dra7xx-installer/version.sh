#!/bin/bash -e

package_name="ipumm-dra7xx-installer"
debian_pkg_name="${package_name}"
package_version="3.00.15.00-r3"
package_source=""
src_dir=""

git_repo=""
git_sha=""
reprepro_dir="i/${package_name}"
dl_path="pool/main/${reprepro_dir}/"

debian_version="${package_version}rcnee1"
debian_untar=""
debian_patch=""

debian_dl_1="https://github.com/rcn-ee/sdk-firmware/raw/master/ipumm-fw/${package_version}/files/dra7-ipu2-fw.xem4"
debian_dl_2="https://github.com/rcn-ee/sdk-firmware/raw/master/ipumm-fw/${package_version}/files/dra7-ipu2-fw.xem4.map"

stretch_version="~stretch+20200424"
buster_version="~buster+20200424"
bionic_version="~bionic+20200424"
focal_version="~focal+20200424"
