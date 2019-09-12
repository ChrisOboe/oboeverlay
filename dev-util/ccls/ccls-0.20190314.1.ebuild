# Copyright 2018 Chris Oboe
# Distributed under the terms of the GNU General Public License v3

EAPI=6

inherit cmake-utils

DESCRIPTION="C/C++/ObjC language server supporting cross references, hierarchies, completion and semantic highlighting"
HOMEPAGE="https://github.com/MaskRay/ccls"

SRC_URI="https://github.com/MaskRay/ccls/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPENT="sys-devel/clang
	dev-libs/rapidjson"
RDEPENT="${DEPEND}"

CLANG_SLOT=${SLOT%%.*}

src_configure() {
		clang_version=$(best_version sys-devel/clang)
		export LLVM_ROOT="/usr/lib/llvm/${clang_version:16:1}"
		local mycmakeargs=(
                -DCMAKE_PREFIX_PATH="$LLVM_ROOT"
        )
        cmake-utils_src_configure
}
