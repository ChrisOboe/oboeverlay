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
IUSE="+pango"
REQUIRED_USE=""

S=${WORKDIR}/i3-${PV}

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
	>=x11-libs/cairo-1.14.4[X,xcb]
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

src_prepare() {
	# i3 does some really ugly things.
	# remove dependency from git
	# https://github.com/Airblader/i3/issues/26
	sed -e "s/I3_VERSION := .*/I3_VERSION := ${PV}/g" -i common.mk
	sed -e "s/VERSION := .*/VERSION := ${PV}/g" -i common.mk

	if ! use pango; then
		sed -e '/^PANGO_.*pangocairo/d' \
		    -e '/PANGO_SUPPORT/ s/1/0/g' \
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
	make mans
}

src_install() {
	default
	dohtml -r docs/*
	doman man/*.1
	exeinto /etc/X11/Sessions
	doexe "${T}"/i3wm
}
