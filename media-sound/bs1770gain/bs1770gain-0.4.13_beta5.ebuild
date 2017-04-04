# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit autotools

DESCRIPTION="A loudness scanner compilant with ITU-R BS.1770 and its flavors"
HOMEPAGE="http://bs1770gain.sourceforge.net/"

MY_PV="0.4.13-beta-5"
SRC_URI="https://sourceforge.net/projects/${PN}/files/${PN}/${MY_PV}/${PN}-${MY_PV}.tar.gz/download -> ${P}.tar.gz"

MY_P=${PN}-${MY_PV}
S=${WORKDIR}/${MY_P}

RDEPEND="media-sound/sox"
DEPEND="${RDEPEND}"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86"

