#!/bin/bash -e

#https://github.com/c9/core

package_name="c9-core-installer"
debian_pkg_name="${package_name}"
package_version="3.1.5000.git20180223"
package_source=""
src_dir=""

git_repo=""
git_sha=""
reprepro_dir="c/${package_name}"
dl_path="pool/main/${reprepro_dir}/"

debian_version="${package_version}-0rcnee4"
debian_untar=""
debian_patch=""

dl_mirror="http://gitlab.gfnd.rcn-ee.org/RobertCNelson/npm-package-cloud9/raw/master/deploy/stretch"

v6="v6.17.0"

real_version="3.1.4056.git20171215"
datestamp="20190727"

debian_dl_1="${dl_mirror}/c9-core_${real_version}-${v6}-${datestamp}-build.tar.xz"

stretch_version="~stretch+20190726"
