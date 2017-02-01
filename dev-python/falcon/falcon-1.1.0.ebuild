# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python2_{6,7} python3_{3,4,5} )

inherit distutils-r1

DESCRIPTION="An unladen web framework for building APIs and app backends."
HOMEPAGE="http://falconframework.org"
SRC_URI="https://github.com/falconry/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="
	dev-python/six[${PYTHON_USEDEP}]
	dev-python/mimeparse[${PYTHON_USEDEP}]
"

PATCHES[0]="${FILESDIR}/${PN}-disable-pytest-runner.patch"
