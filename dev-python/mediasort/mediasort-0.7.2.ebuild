# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python3_{5,6} )

inherit distutils-r1

DESCRIPTION="A library for automaticly sorting mediafiles"
HOMEPAGE="https://github.com/ChrisOboe/mediasort"
LICENSE="GPL-3"
SLOT="0"
IUSE=""

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/ChrisOboe/${PN}.git"
	KEYWORDS=""
else
	SRC_URI="https://github.com/ChrisOboe/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

#S="${WORKDIR}/${PN}"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="
	dev-python/fuzzywuzzy[${PYTHON_USEDEP}]
	dev-python/guessit[${PYTHON_USEDEP}]
	dev-python/tmdbsimple[${PYTHON_USEDEP}]
	dev-python/python-dateutil[${PYTHON_USEDEP}]
	dev-python/mako[${PYTHON_USEDEP}]"
