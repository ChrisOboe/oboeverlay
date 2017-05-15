# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

inherit git-r3

DESCRIPTION="A simple scriptable popup dialog to run on X."
HOMEPAGE="https://github.com/emgram769/lighthouse"
EGIT_REPO_URI="https://github.com/emgram769/lighthouse.git"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="x11-libs/libX11
x11-libs/libxcb
x11-libs/cairo
x11-libs/pango"
RDEPEND="${DEPEND}"

PATCHES[0]="${FILESDIR}/${PN}-fix-keyboard.patch"
PATCHES[1]="${FILESDIR}/${PN}-fix-linking.patch"

src_compile() {
	if [ -f Makefile ] || [ -f GNUmakefile ] || [ -f makefile ]; then
		emake all || die "emake failed"
	fi
}

src_install() {
	dobin lighthouse
}


