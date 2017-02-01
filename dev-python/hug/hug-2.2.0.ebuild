# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python3_{3,4,5} )

inherit distutils-r1

DESCRIPTION="A Python framwork that makes developing APIs as simple as possible"
HOMEPAGE="https://www.hug.rest"
SRC_URI="https://github.com/timothycrosley/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/falcon[${PYTHON_USEDEP}]
"
