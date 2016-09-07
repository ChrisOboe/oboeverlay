# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit eutils toolchain-funcs

DESCRIPTION="i3 with more features"
HOMEPAGE="https://github.com/Airblader/i3"
SRC_URI="https://github.com/Airblader/i3/archive/${PV}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="+cairo +pango"
REQUIRED_USE="pango? ( cairo )"

S=${WORKDIR}/i3

CDEPEND="dev-libs/libev
	dev-libs/libpcre
	>=dev-libs/yajl-2.0.3
	x11-libs/libxcb[xkb]
	x11-libs/libxkbcommon[X]
	x11-libs/startup-notification
	x11-libs/xcb-util
	x11-libs/xcb-util-cursor
	x11-libs/xcb-util-keysyms
	x11-libs/xcb-util-wm
	cairo? (
		>=x11-libs/cairo-1.14.4[X,xcb]
	)
	pango? (
		>=x11-libs/pango-1.30.0[X]
	)"
DEPEND="${CDEPEND}
	virtual/pkgconfig"
RDEPEND="${CDEPEND}
	dev-lang/perl
	dev-perl/AnyEvent-I3
	dev-perl/JSON-XS
	!x11-wm/i3"

DOCS=( RELEASE-NOTES-${PV} )

pkg_setup() {
	mkdir "${S}"
}

src_prepare() {
	epatch "${FILESDIR}"/${P}-pango.patch

	if ! use pango; then
		sed -e '/^PANGO_.*pangocairo/d' \
		    -e '/PANGO_SUPPORT/ s/1/0/g' \
			-i common.mk || die
	fi

	if ! use cairo; then
		sed -e '/^PANGO_.*cairo/d' \
		    -e '/CAIRO_SUPPORT/ s/1/0/g' \
			-i common.mk || die
	fi

	cat <<- EOF > "${T}"/i3wm
		#!/bin/sh
		exec /usr/bin/i3
	EOF
	sed -e 's/FALSE/false/' -i src/handlers.c || die #546444
	epatch_user #471716
}

src_compile() {
	emake V=1 CC="$(tc-getCC)" AR="$(tc-getAR)"
}

src_install() {
	default
	dohtml -r docs/*
	doman man/*.1
	exeinto /etc/X11/Sessions
	doexe "${T}"/i3wm
}
