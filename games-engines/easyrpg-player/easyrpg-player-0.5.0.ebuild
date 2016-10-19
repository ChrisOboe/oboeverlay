# Copyright 2016 Chris Oboe
# Distributed under the terms of the GNU General Public License v3

EAPI=5

inherit cmake-utils games

DESCRIPTION="RPG Maker 2000/2003 and EasyRPG games interpreter"
HOMEPAGE="https://easyrpg.org"
SRC_URI="https://github.com/EasyRPG/Player/archive/${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+freetype +harfbuzz +libsndfile mpg123 vorbis +speexdsp +wildmidi"

S="${WORKDIR}/Player-${PV}"

RDEPENT="~dev-libs/liblcf-0.5.0
	media-libs/libsdl2
	media-libs/sdl2-mixer
	x11-libs/pixman
	media-libs/libpng
	sys-libs/zlib
	freetype? ( >=media-libs/freetype-2 )
	harfbuzz? ( media-libs/harfbuzz )
	mpg123? ( media-sound/mpg123 )
	wildmidi? ( media-sound/wildmidi )
	speexdsp? ( media-libs/speex )
	vorbis? ( media-libs/libvorbis )
	libsndfile? ( media-libs/libsndfile )"

DEPENT="${RDEPEND}
	virtual/pkgconfig
	sys-devel/make"

src_prepare() {
	epatch "${FILESDIR}/easyrpg-player-0.5.0-cmake-fix.patch"

}

src_configure() {
	CMAKE_IN_SOURCE_BUILD=true
	local mycmakeargs=(
		$(cmake-utils_use freetype PLAYER_WITH_FREETYPE)
		$(cmake-utils_use harfbuzz PLAYER_WITH_HARFBUZZ)
		$(cmake-utils_use libsndfile PLAYER_WITH_LIBSNDFILE)
		$(cmake-utils_use mpg123 PLAYER_WITH_MPG123)
		$(cmake-utils_use vorbis PLAYER_WITH_OGGVORBIS)
		$(cmake-utils_use speexdsp PLAYER_WITH_SPEEXDSP)
		$(cmake-utils_use wildmidi PLAYER_WITH_WILDMIDI)
		-DHAVE_SDL_MIXER=1
		-DPLAYER_ENABLE_TESTS=OFF
		-DPLAYER_ENABLE_FMMIDI=ON
		-DPLAYER_BUILD_LIBLCF=OFF
	)
	cmake-utils_src_configure
}
