# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"
PYTHON_COMPAT=( python{2_6,2_7,3_1,3_2,3_3,3_4,3_5} )

inherit distutils-r1

MY_PN="mailcap_fix"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="A python module that will check for package updates"
HOMEPAGE="https://github.com/bboe/update_checker"
SRC_URI="mirror://pypi/${MY_PN:0:1}/${MY_PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc"

#S="${WORKDIR}/${MY_P}"

DEPEND="dev-python/setuptools"
RDEPEND=">=dev-python/requests-2.3.0"
