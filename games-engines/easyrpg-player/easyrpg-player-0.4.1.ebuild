# Copyright 2016 Chris Oboe
# Distributed under the terms of the GNU General Public License v3

EAPI=5

inherit autotools games

DESCRIPTION="RPG Maker 2000/2003 and EasyRPG games interpreter"
HOMEPAGE="https://easyrpg.org"
SRC_URI="https://github.com/EasyRPG/Player/archive/${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

S="${WORKDIR}/Player-${PV}"

RDEPENT="=dev-libs/liblcf-0.4.1
	media-libs/libsdl2
	media-libs/sdl2-mixer
	x11-libs/pixman
	media-libs/libpng
	sys-libs/zlib
	>=media-libs/freetype-2
	media-sound/mpg123
	media-libs/libsndfile"

DEPENT="${RDEPEND}
	virtual/pkgconfig
	sys-devel/make"

src_prepare() {
	eapply_user
	eautoreconf
}
