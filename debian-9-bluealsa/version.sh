#!/bin/bash -e

mirror="https://archive.raspberrypi.org/debian"

package_name="bluealsa"
debian_pkg_name="${package_name}"
package_version="0.13"
package_source="${package_name}_${package_version}.tar.xz"
src_dir="${package_name}"

git_repo=""
git_sha=""
reprepro_dir="b/${package_name}"
dl_path="pool/main/${reprepro_dir}/"

debian_version="${package_version}"
#debian_untar="${package_name}_${debian_version}.debian.tar.xz"
debian_patch=""

jessie_version="~jessie+20190410"
stretch_version="~stretch+20200131"
buster_version="~buster+20200131"
bionic_version="~bionic+20200131"
