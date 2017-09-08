# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python3_{5,6} )

inherit distutils-r1

DESCRIPTION="A tool for automaticly sorting mediafiles"
HOMEPAGE="https://github.com/ChrisOboe/cmediasort"

LICENSE="GPL-3"
SLOT="0"
IUSE=""

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/ChrisOboe/${PN}.git"
	SRC_URI=""
	KEYWORDS=""
else
	SRC_URI="https://github.com/ChrisOboe/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

#S="${WORKDIR}/${P}"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="dev-python/appdirs[${PYTHON_USEDEP}]
         dev-python/pyyaml[${PYTHON_USEDEP}]"

if [[ ${PV} == 9999 ]]; then
	RDEPEND="${RDEPEND}
			=dev-python/mediasort-9999[${PYTHON_USEDEP}]"
else
	RDEPEND="${RDEPEND}
			dev-python/mediasort[${PYTHON_USEDEP}]"
fi
