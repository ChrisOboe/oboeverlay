# Copyright 2018 Chris Oboe
# Distributed under the terms of the GNU General Public License v3

EAPI=6

inherit cmake-utils git-r3 llvm

DESCRIPTION="A C/C++ language server supporting multi-mullion line code base, powered by libclang."
HOMEPAGE="https://github.com/cquery-project/cquery"

EGIT_REPO_URI="https://github.com/cquery-project/cquery"
EGIT_COMMIT="b523aa928acf8ffb3de6b22c79db7366a9672489"
# the source tarball doesn't contain the 3rdparty folder
# SRC_URI="https://github.com/cquery-project/cquery/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPENT="sys-devel/clang"
RDEPENT="${DEPEND}"

CLANG_SLOT=${SLOT%%.*}

src_configure() {
		clang_version=$(best_version sys-devel/clang)
		export LLVM_ROOT="/usr/lib/llvm/${clang_version:16:1}"
		local mycmakeargs=(
                -DSYSTEM_CLANG=ON
                -DCMAKE_PREFIX_PATH="$LLVM_ROOT"
        )
        cmake-utils_src_configure
}
