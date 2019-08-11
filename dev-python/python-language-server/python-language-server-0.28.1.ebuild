# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python3_{4,5,6,7} )

inherit distutils-r1

DESCRIPTION="An implementation of the Language Server Protocol for Python"
HOMEPAGE="https://pypi.python.org/pypi/python-language-server https://github.com/palantir/python-language-server"
SRC_URI="https://github.com/palantir/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="
	dev-python/future[${PYTHON_USEDEP}]
	<dev-python/jedi-0.15[${PYTHON_USEDEP}]
	>dev-python/jedi-0.13.2[${PYTHON_USEDEP}]
	dev-python/pluggy[${PYTHON_USEDEP}]
	dev-python/python-jsonrpc-server[${PYTHON_USEDEP}]
"
