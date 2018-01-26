# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_5 )
inherit distutils-r1 versionator

MY_PV=3.0.0rc2
MY_P=${PN}-${MY_PV}

DESCRIPTION="An interactive, SSL-capable, man-in-the-middle HTTP proxy"
HOMEPAGE="http://mitmproxy.org/"
SRC_URI="https://github.com/mitmproxy/mitmproxy/archive/v${MY_PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc examples test"

S=${WORKDIR}/${MY_P}

RDEPEND="
    >=dev-python/ldap3-2.4[${PYTHON_USEDEP}] <dev-python/ldap3-2.5
    >=dev-python/h11-0.7.0[${PYTHON_USEDEP}] <dev-python/h11-0.8
    >=dev-python/wsproto-0.11.0[${PYTHON_USEDEP}] <dev-python/wsproto-0.12.0
    >=dev-python/blinker-1.4[${PYTHON_USEDEP}] <dev-python/blinker-1.5
    >=dev-python/click-6.2[${PYTHON_USEDEP}] <dev-python/click-7
    >=dev-python/certifi-2015.11.20.1[${PYTHON_USEDEP}]
    >=dev-python/cryptography-2.1.4[${PYTHON_USEDEP}] <dev-python/cryptography-2.2
    >=dev-python/hyper-h2-3[${PYTHON_USEDEP}] <dev-python/hyper-h2-4
    >=dev-python/hyperframe-5[${PYTHON_USEDEP}] <dev-python/hyperframe-6
    >=dev-python/kaitaistruct-0.7[${PYTHON_USEDEP}] <dev-python/kaitaistruct-0.8
    >=dev-python/passlib-1.6.5[${PYTHON_USEDEP}] <dev-python/passlib-1.8
    >=dev-python/pyasn1-0.3.1[${PYTHON_USEDEP}] <dev-python/pyasn1-0.5
    >=dev-python/pyopenssl-17.2[${PYTHON_USEDEP}] <=dev-python/pyopenssl-17.6
    >=dev-python/pyparsing-2.1.3[${PYTHON_USEDEP}] <dev-python/pyparsing-2.3
    >=dev-python/pyperclip-1.5.22[${PYTHON_USEDEP}] <dev-python/pyperclip-1.6
    >=dev-python/requests-2.9.1[${PYTHON_USEDEP}] <dev-python/requests-3
    >=dev-python/ruamel-yaml-0.13.2[${PYTHON_USEDEP}] <dev-python/ruamel-yaml-0.14
    >=www-servers/tornado-4.3[${PYTHON_USEDEP}] <www-servers/tornado-4.6
    >=dev-python/urwid-1.3.1[${PYTHON_USEDEP}] <dev-python/urwid-1.4
    >=dev-python/brotlipy-0.5.1[${PYTHON_USEDEP}] <dev-python/brotlipy-0.8
    >=dev-python/sortedcontainers-1.5.4[${PYTHON_USEDEP}] <dev-python/sortedcontainers-1.6
    examples? ( dev-python/beautifulsoup:4[${PYTHON_USEDEP}] <dev-python/beautifulsoup-4.7:4
        >=dev-python/pillow-4.3[${PYTHON_USEDEP}] <dev-python/pillow-5.1
    )
"

DEPEND="${RDEPEND}
	>=dev-python/setuptools-11.3[${PYTHON_USEDEP}]
	test? (
		>=dev-python/mock-1.0.1[${PYTHON_USEDEP}]
		>=dev-python/nose-1.3.0[${PYTHON_USEDEP}]
	)
	doc? ( dev-python/sphinxcontrib-documentedlist )"
#fixme: bump it too
#		=www-servers/pathod-$(get_version_component_range 1-2)*[${PYTHON_USEDEP}]


python_prepare() {
	# replace git describe with actual version
	sed -i -e "s/\"git\", \"describe\", \"--tags\", \"--long\"/'echo', 'v${PV}-0-0'/" docs/conf.py || die
}

python_test() {
	nosetests -v || die "Tests fail with ${EPYTHON}"
}

python_compile_all() {
	use doc && emake -C docs html
}

python_install_all() {
	local DOCS=( CHANGELOG CONTRIBUTORS )
	use doc && local HTML_DOCS=( docs/_build/html/. )
	use examples && local EXAMPLES=( examples/. )

	distutils-r1_python_install_all
}
