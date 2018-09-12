# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python3_{4,5,6,7} )

inherit distutils-r1 eutils

DESCRIPTION="RTV provides an interface to view and interact with reddit from your terminal."
HOMEPAGE="https://github.com/michael-lazar/rtv"
SRC_URI="https://github.com/michael-lazar/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

# S="${WORKDIR}/${PN}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="
	dev-python/decorator[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
	dev-python/kitchen[${PYTHON_USEDEP}]
	dev-python/beautifulsoup[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-lang/python[ncurses]"
