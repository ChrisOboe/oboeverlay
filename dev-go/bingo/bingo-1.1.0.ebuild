# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/saibing"
GOLANG_PKG_NAME="${PN}"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_VERSION="${PV}"
GOLANG_PKG_HAVE_TEST=0
GOLANG_PKG_DEPENDENCIES=(
	"github.com/fsnotify/fsnotify:c2828203cd70a50dcccfb2761f8b1f8ceef9a8e9" #v1.4.7
	"github.com/sourcegraph/jsonrpc2:549eb959f029d014d623104d40ab966d159a92de"
	"github.com/slimsag/godocmd:a1005ad29fe3e4831773a8184ee7ebb3a41d1347"
	"github.com/golang/tools:498d95493402f719ce3de5c8cb60d1b50d0a1239 -> golang.org/x"
	"github.com/golang/sys:badf5585203e739f88c2c6cd34188a6f54b5d619 -> golang.org/x"
)

inherit golang-single

DESCRIPTION="Bingo is a Go language server that speaks Language Server Protocol."
HOMEPAGE="https://github.com/saibing/bingo"


LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86 ~amd64-fbsd ~x86-fbsd"
