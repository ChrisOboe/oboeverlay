# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python3_{3,4,5} )

inherit distutils-r1

DESCRIPTION="A tool for automaticly sorting mediafiles"
HOMEPAGE="https://github.com/ChrisOboe/cmediasort"
SRC_URI="https://github.com/ChrisOboe/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

#S="${WORKDIR}/${P}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="dev-python/mediasort[${PYTHON_USEDEP}]"
