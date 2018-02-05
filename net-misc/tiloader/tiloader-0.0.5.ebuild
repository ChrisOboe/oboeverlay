# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/chrisoboe"
GOLANG_PKG_VERSION="${PV}"
GOLANG_PKG_NAME="${PN}"

GOLANG_PKG_DEPENDENCIES=(
	"github.com/chrisoboe/rijndael256:945ef34"
	"github.com/naoina/toml:9fafd69"
	"github.com/naoina/go-stringutil:6b638e9"
	"github.com/pkg/errors:30136e2"
)

inherit golang-single

DESCRIPTION="A download tool for the tidal streaming service."
HOMEPAGE="https://github.com/chrisoboe/tiloader"

KEYWORDS="~amd64 ~arm"
LICENSE="GPL-3"
SLOT="0"
