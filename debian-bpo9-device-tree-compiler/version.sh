#!/bin/bash -e

mirror="http://http.debian.net/debian"

package_name="device-tree-compiler"
debian_pkg_name="${package_name}"
package_version="1.4.7"

git_repo=""
git_sha=""
reprepro_dir="l/${package_name}"
dl_path="pool/main/${reprepro_dir}/"

debian_version="${package_version}-3"
debian_untar="${package_name}_${debian_version}.debian.tar.xz"
debian_patch=""

dist="debian"
suite="stretch"
deb_arch="armhf"
