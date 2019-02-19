# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit user

DESCRIPTION="a vendor and technology agnostic open source automation software for your home"
HOMEPAGE="https://www.openhab.org/"

SRC_URI="https://bintray.com/openhab/mvn/download_file?file_path=org/${PN}/distro/${PN}/${PV}/${P}.zip"
LICENSE="EPL-1.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="<virtual/jre-1.9"

S=${WORKDIR}/

pkg_setup() {
	enewuser openhab
}

src_install() {
	OPENHAB_HOME=/opt/openhab
	insinto ${OPENHAB_HOME}
	doins -r ./*
	fperms +x ${OPENHAB_HOME}/runtime/bin/karaf

	dodir /usr/bin
        echo "#! /bin/sh
exec ${OPENHAB_HOME}/runtime/bin/karaf \"\$@\"" > ${D}/usr/bin/openhab
        fperms +x /usr/bin/openhab

	fowners -R openhab ${OPENHAB_HOME}/userdata
	fowners -R openhab ${OPENHAB_HOME}/addons
	fowners -R openhab ${OPENHAB_HOME}/conf

	newinitd "${FILESDIR}"/${P}.init ${PN}
}

