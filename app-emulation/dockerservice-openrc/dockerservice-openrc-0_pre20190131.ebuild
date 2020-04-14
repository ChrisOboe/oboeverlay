# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public Licecnse v2

EAPI=6

inherit git-r3

DESCRIPTION="Run docker-compose services as openrc services"
HOMEPAGE="https://github.com/0x17de/dockerservice-openrc"
EGIT_REPO_URI="https://github.com/0x17de/dockerservice-openrc"

EGIT_COMMIT="44f9e2f92620e3403549b57f2c75ce513056d277"

SLOT="0"
LICENSE="MIT"
KEYWORDS="~amd64"

RDEPEND="app-emulation/docker-compose"

src_prepare() {
    # use /etc/docker instead of /root/docker for configuration
    sed -i -e 's/SUBCFG=\"\/root/SUBCFG=\"\/etc/g' dockerservice || die
    eapply_user
}

src_compile() {
    :;
}

src_install() {
    doinitd dockerservice
}
