#!/bin/bash -e

mirror="http://http.debian.net/debian"

package_name="cockpit"
debian_pkg_name="${package_name}"
package_version="237"

git_repo=""
git_sha=""
reprepro_dir="c/${package_name}"
dl_path="pool/main/${reprepro_dir}/"

debian_version="${package_version}-1"
debian_untar="${package_name}_${debian_version}.debian.tar.xz"
debian_patch=""

dist="debian"
suite="buster"
deb_arch="armhf"
