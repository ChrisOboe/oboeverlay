# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

PYTHON_COMPAT=( python{2_7,3_4,3_5} )

inherit distutils-r1

DESCRIPTION="Module implementing munkres algorithm for the Assignment Problem"
HOMEPAGE="https://pypi.python.org/pypi/munkres/"

SRC_URI="https://github.com/bmc/${PN}/archive/release-${PV}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/${PN}-release-${PV}"


LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test doc"

python_test() {
	"${PYTHON}" "${PN}.py" || die
}

src_install() {
	distutils-r1_src_install
	use doc && dohtml -r html/
}
