EAPI="6"

DESCRIPTION="A utility to spin-down disks after specified period of time. (when hdparm -B/J is not enough)"
HOMEPAGE="http://hd-idle.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tgz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}"

src_install() {
	emake DESTDIR="${D}" install
	einstalldocs

	newinitd ${FILESDIR}/hd-idle.init hd-idle
	newconfd ${FILESDIR}/hd-idle.conf hd-idle
}
