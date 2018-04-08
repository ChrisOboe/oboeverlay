# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/ChrisOboe"
GOLANG_PKG_VERSION="${PV}"
GOLANG_PKG_NAME="${PN}"

GOLANG_PKG_DEPENDENCIES=(
	"github.com/BurntSushi/toml:b26d9c3"
	"github.com/pkg/errors:645ef00"
	"github.com/emersion/go-imap:db2527e"
	"github.com/emersion/go-sasl:7e096a0"
	"github.com/golang/text:f21a4df -> golang.org/x"
)

inherit golang-single

DESCRIPTION="Cli application to get the number of unseen mails."
HOMEPAGE="https://github.com/chrisoboe/unseenmail"

KEYWORDS="~amd64 ~arm"
LICENSE="GPL-3"
SLOT="0"
