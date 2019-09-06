#!/bin/bash -e

#https://packages.debian.org/source/sid/libgpiod

mirror="http://http.debian.net/debian"

package_name="libgpiod"
debian_pkg_name="${package_name}"
package_version="1.4.1"
package_source="${package_name}_${package_version}.orig.tar.xz"
src_dir="${package_name}-${package_version}"
#src_dir="libgpiod-v1.0.x"

git_repo=""
git_sha=""
reprepro_dir="libg/${package_name}"
dl_path="pool/main/${reprepro_dir}/"

debian_version="${package_version}-2"
debian_untar="${package_name}_${debian_version}.debian.tar.xz"
debian_patch=""
local_patch="rcnee2"

stretch_version="~stretch+20190906"
buster_version="~buster+20190906"
bionic_version="~bionic+20190906"
