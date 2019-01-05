# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/sourcegraph"
GOLANG_PKG_NAME="${PN}"
GOLANG_PKG_VERSION="${PV}"
GOLANG_PKG_HAVE_TEST=0

inherit golang-single

DESCRIPTION="Go language server to add Go support to editors and other tools that use the Language Server Protocol"
HOMEPAGE="https://github.com/sourcegraph/go-langserver"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86 ~amd64-fbsd ~x86-fbsd"
