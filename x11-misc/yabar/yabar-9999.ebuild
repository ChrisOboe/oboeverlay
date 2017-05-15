EAPI="6"

inherit eutils git-r3

DESCRIPTION="A modern and lightweight status bar for X window managers."
HOMEPAGE="http://github.com/geommer/yabar"
EGIT_REPO_URI="https://github.com/geommer/yabar"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEEND="
	x11-libs/gdk-pixbuf
	x11-libs/xcb-util-wm
	dev-libs/libconfig
	x11-libs/cairo
	x11-libs/pango
	media-libs/alsa-lib
	net-wireless/iw
	x11-apps/xrandr
"

DEPEND="${RDEPEND}"

src_install() {
	dobin yabar
}
