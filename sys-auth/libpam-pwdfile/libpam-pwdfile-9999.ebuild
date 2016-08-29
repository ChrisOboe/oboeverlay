# Distributed under the terms of the GNU General Public License v3
# $Header: $

EAPI=5

inherit eutils git-2

DESCRIPTION="a simple PAM module which provides the authentication using a set of user/password pairs"
HOMEPAGE="https://github.com/tiwe-de/libpam-pwdfile"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

EGIT_REPO_URI="https://github.com/tiwe-de/libpam-pwdfile"

DEPEND="sys-libs/pam"
RDEPEND="${DEPEND}"
