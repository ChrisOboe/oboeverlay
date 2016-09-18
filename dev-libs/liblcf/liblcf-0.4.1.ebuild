# Copyright 2016 Chris Oboe
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit autotools

DESCRIPTION="Library to handle RPG Maker 2000/2003 and EasyRPG projects"
HOMEPAGE="https://easyrpg.org"
SRC_URI="https://github.com/EasyRPG/liblcf/archive/${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPENT="dev-libs/expat
	dev-libs/icu"

DEPENT="${RDEPEND}
	virtual/pkgconfig
	sys-devel/make"

src_prepare() {
	eapply_user
	eautoreconf
}
