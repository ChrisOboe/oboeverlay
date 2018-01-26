# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 python3_{5,6} )

inherit distutils-r1

DESCRIPTION="WebSockets state-machine based protocol implementation"
HOMEPAGE="https://pypi.python.org/pypi/wsproto/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 ~arm ~arm64 ~ia64 ~mips ppc ppc64 ~sparc x86 ~amd64-linux ~x86-linux"
IUSE=""

DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	dev-python/h11[${PYTHON_USEDEP}]
"
