# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit toolchain-funcs meson

DESCRIPTION="A compositor for X, and a fork of xcompmgr-dana"
HOMEPAGE="https://github.com/yshui/compton"
SRC_URI="https://github.com/yshui/compton/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 ~ppc x86"
IUSE="dbus +opengl +pcre xinerama"

COMMON_DEPEND="
	x11-libs/libX11
	x11-libs/libXext
	x11-libs/libxcb
	x11-libs/libXdamage
	x11-libs/libXfixes
	x11-libs/xcb-util-renderutil
	x11-libs/libXrender
	x11-libs/libXrandr
	x11-libs/libXcomposite
	x11-libs/xcb-util-image
	x11-libs/pixman
	dev-libs/libev
	dev-libs/libconfig:=
	dev-libs/libxdg-basedir
	dbus? ( sys-apps/dbus )
	opengl? ( virtual/opengl )
	pcre? ( dev-libs/libpcre:3 )
	xinerama? ( x11-libs/libXinerama )"
RDEPEND="${COMMON_DEPEND}
	x11-apps/xprop
	x11-apps/xwininfo"
DEPEND="${COMMON_DEPEND}
	app-text/asciidoc
	x11-base/xorg-proto"

src_configure() {
	meson_use xinerama xinerama
	meson_use dbus dbus
	meson_use opengl opengl
	meson_use pcre regex
	meson_src_configure
}

