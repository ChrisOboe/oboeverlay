# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/ChrisOboe"
GOLANG_PKG_VERSION="${PV}"
GOLANG_PKG_NAME="${PN}"

GOLANG_PKG_DEPENDENCIES=(
	"github.com/ChrisOboe/rijndael256:945ef34"
	"github.com/ChrisOboe/tidapi:aa5e7b627a5a817d08015dbd24b81247bca69f78"
	"github.com/ChrisOboe/dirs:df7fd685f8b11de67458c25c0b0aa058bd547f37"
	"github.com/alexflint/go-arg:f7c0423bd11ee80ab81d25c6d46f492998af8547"
	"github.com/BurntSushi/toml:a368813c5e648fee92e5f6c30e3944ff9d5e8895"
	"github.com/pkg/errors:816c908"
)

inherit golang-single

DESCRIPTION="A download tool for the tidal streaming service."
HOMEPAGE="https://github.com/chrisoboe/ti-dl"

KEYWORDS="~amd64 ~arm"
LICENSE="GPL-3"
SLOT="0"
