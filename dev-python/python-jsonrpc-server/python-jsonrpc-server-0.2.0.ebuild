# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python3_{4,5,6,7} )

inherit distutils-r1

DESCRIPTION="A Python 2 and 3 asynchronous JSON RPC server"
HOMEPAGE="https://pypi.python.org/pypi/${PN} https://github.com/palantir/${PN}"
# github releases don't work, because the tags needed for versioneer aren't available in the github tarball
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	dev-python/versioneer[${PYTHON_USEDEP}]
"
RDEPEND="
	dev-python/future[${PYTHON_USEDEP}]
"
