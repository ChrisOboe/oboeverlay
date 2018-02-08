# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit cmake-utils

DESCRIPTION="Arcan is a powerful development framework for creating virtually anything from user interfaces for specialized embedded applications all the way to full-blown standalone desktop environments."
HOMEPAGE="https://arcan-fe.com/"
SRC_URI="https://github.com/letoram/${PN}/archive/${PV}.tar.gz"

SLOT="0"
LICENSE="OTHER"
KEYWORDS="~amd64 ~x86"
IUSE="-sdl dri jit -debug"

REQUIRED_USE="sdl? ( !dri )"
RDEPEND="
	media-libs/libsdl
	media-libs/freetype
	media-libs/openal
	dev-db/sqlite:3
	media-libs/mesa
	media-video/vlc
	virtual/ffmpeg
	"
DEPEND="${RDEPEND}
        dev-util/cmake
        virtual/opengl
        !jit? ( dev-lang/lua )
        jit? ( dev-lang/luajit )
        "
S=${S}/src
src_prepare() {
        cmake-utils_src_prepare
}

PATCHES[0]="${FILESDIR}/lib64.patch"

src_configure() {
	if use debug; then
	    bt="Debug"
	else
	    bt="Release"
	fi
        local mycmakeargs=(
            -DAGP_PLATFORM=gl21
            -DENGINE_BUILDTAG=${PV}
            -DSTATIC_SQLITE3=Off
            -DSTATIC_OPENAL=Off
            -DSTATIC_FREETYPE=Off
            -DENABLE_LWA=Off
            -DENABLE_SIMD=On
            -DNO_FSRV=Off
            -DSHMIF_TUI_ACCEL=On
            -DLIBRARY_OUTPUT_PATH=$(get_libdir)
            $(cmake-utils_use_enable jit JIT)                   
       )
       if use dri; then
           mycmakeargs+=(-DVIDEO_PLATFORM=egl-dri)
       elif use ssl; then
           mycmakeargs+=(-DVIDEO_PLATFORM=sdl)
       fi

       CMAKE_BUILD_TYPE=${bt}
       cmake-utils_src_configure
}
