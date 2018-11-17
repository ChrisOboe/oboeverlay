# Copyright 2018 Chris Oboe
# Distributed under the terms of the GNU General Public License v3

EAPI=6

inherit cmake-utils git-r3

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

src_configure() {
        local mycmakeargs=(
                -DSYSTEM_CLANG=ON
                -DCMAKE_PREFIX_PATH="/usr/lib/llvm/6;/usr/lib/llvm/7"
        )
        cmake-utils_src_configure
}
