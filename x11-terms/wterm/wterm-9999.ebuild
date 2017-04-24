EAPI="6"

inherit eutils savedconfig git-r3

DESCRIPTION="xterm for wayland"
HOMEPAGE="http://github.com/majestrate/wterm"
EGIT_REPO_URI="https://github.com/majestrate/wterm"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="video_cards_intel video_cards_nouveau savedconfig"

RDEPEEND="
	media-libs/fontconfig
	dev-libs/wayland
	x11-libs/libxkbcommon
	x11-libs/pixman
	video_cards_intel? x11-libs/libdrm[video_cards_intel]
	video_cards_nouveau? x11-libs/libdrm[video_cards_nouveau]"

DEPEND="${RDEPEND}"

src_configure() {
	if ! use video_cards_intel; then
		sed -e 's/ENABLE_INTEL = 1/ENABLE_INTEL = 0/g' -i config.mk || die
	fi
	if ! use video_cards_nouveau; then
		sed -e 's/ENABLE_NOUVEAU = 1/ENABLE_NOUVEAU = 0/g' -i config.mk || die
	fi

	restore_config include/config.h
}

src_install() {
	dobin wterm
	mkdir -p ${D}/usr/share/terminfo
	tic -s -o ${D}/usr/share/terminfo wterm.info || die
	save_config include/config.h
}
