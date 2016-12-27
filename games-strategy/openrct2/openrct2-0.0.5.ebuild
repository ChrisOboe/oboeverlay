# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit cmake-utils

DESCRIPTION="Open source re-implementation of Roller Coaster Tycoon 2"
HOMEPAGE="https://openrct2.website/"
SRC_URI="https://github.com/OpenRCT2/OpenRCT2/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="network twitch opengl libressl"

DEPEND="
	media-libs/libsdl2
	media-libs/sdl2-ttf
	media-libs/speex
	media-libs/libpng
	sys-libs/zlib
	dev-libs/jansson
	twitch? ( net-misc/curl )
	network? (
		libressl? ( dev-libs/libressl:0= )
		!libressl? ( dev-libs/openssl:0= )
	)
	opengl? ( virtual/opengl )
"
RDEPEND="${DEPEND}"

MAKEOPTS+=" -j1"

S="${WORKDIR}/OpenRCT2-${PV}"

src_configure() {
	local mycmakeargs=(
		-DDISABLE_NETWORK="$(usex network)"
		-DDISABLE_HTTP_TWITCH="$(usex twitch)"
		-DDISABLE_OPENGL="$(usex opengl)"
	)
	cmake-utils_src_configure
}
