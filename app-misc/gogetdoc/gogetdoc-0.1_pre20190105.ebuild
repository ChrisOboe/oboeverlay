# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/zmb3"
GOLANG_PKG_VERSION="a2964ac3d615b00742f1a02db7a4f13f42cc936c"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/golang/tools:498d954 -> golang.org/x"
)

inherit golang-single

DESCRIPTION="Gets documentation for items in Go source code"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"

RDEPEND=">=dev-lang/go-1.7.0"
