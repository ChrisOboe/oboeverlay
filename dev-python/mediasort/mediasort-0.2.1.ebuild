# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python3_{3,4,5} )

inherit distutils-r1

DESCRIPTION="A library for automaticly sorting mediafiles"
HOMEPAGE="https://git.smackmack.industries/ChrisOboe/mediasort"
SRC_URI="https://git.smackmack.industries/ChrisOboe/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

S="${WORKDIR}/${PN}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="
	dev-python/guessit[${PYTHON_USEDEP}]
	dev-python/tmdbsimple[${PYTHON_USEDEP}]
	dev-python/python-dateutil[${PYTHON_USEDEP}]"
