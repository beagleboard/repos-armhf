#!/bin/bash -e

package_name="bb-beagle-flasher"
debian_pkg_name="${package_name}"
package_version="1.20250618.0"
package_source=""
src_dir=""

git_repo=""
git_sha=""
reprepro_dir="b/${package_name}"
dl_path="pool/main/${reprepro_dir}/"

debian_version="${package_version}-0"
debian_untar=""
debian_patch=""

clear_changelog="enable"

bullseye_version="~bullseye+20250618"
bookworm_version="~bookworm+20250618"
trixie_version="~trixie+20250618"
noble_version="~noble+20250618"
