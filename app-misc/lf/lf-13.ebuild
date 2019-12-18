# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit golang-build golang-vcs-snapshot

DESCRIPTION="Terminal file manager"
HOMEPAGE="https://github.com/gokcehan/lf"
LICENSE="MIT"

EGO_PN="github.com/gokcehan/lf"
EGIT_COMMIT="9f661344edf8752b6906c4368f7f30d3af27ea3b"

SRC_URI="https://github.com/gokcehan/lf/archive/r${PV}.tar.gz -> ${P}.tar.gz"
KEYWORDS="~amd64 ~arm ~x86"

SLOT="0/${PVR}"
