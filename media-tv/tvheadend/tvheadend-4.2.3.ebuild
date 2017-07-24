# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit eutils linux-info systemd toolchain-funcs user

DESCRIPTION="Tvheadend is a TV streaming server and digital video recorder"
HOMEPAGE="https://tvheadend.org/"
#EGIT_REPO_URI="git://github.com/tvheadend/tvheadend.git"
SRC_URI="https://github.com/${PN}/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

# doesn't compile without iptv. to its force enabled until fixed

IUSE="avahi bundle dbus cwc capmt constcw dvben50221 +dvb dvbcsa ffmpeg hdhomerun libav +imagecache inotify satip systemd +timeshift uriparser xmltv zlib libressl" #iptv

# The don't make any sense with ffmpeg_static disabled
# aad/libfdk nvenc qsv theora vaapi vorbis vpx x264 x265

DEPEND="
	virtual/libiconv
	avahi? ( net-dns/avahi )
	dbus? ( sys-apps/dbus )
	!libressl? ( dev-libs/openssl:= )
	libressl? ( dev-libs/libressl:= )
	ffmpeg? (
		!libav? ( media-video/ffmpeg:0/55.57.57 )
		libav? ( media-video/libav:= )
	)
	hdhomerun? ( media-libs/libhdhomerun  )
	uriparser? ( dev-libs/uriparser )
	zlib? ( sys-libs/zlib )
	dvb? (  virtual/linuxtv-dvb-headers
		media-tv/linuxtv-dvb-apps )
        dvbcsa? ( media-libs/libdvbcsa )
        dvben50221? ( media-tv/linuxtv-dvb-apps )

	virtual/pkgconfig"

RDEPEND+="
	xmltv? ( media-tv/xmltv )"

REQUIRED_USE="bundle? ( zlib )
dvbcsa? ( || ( cwc capmt constcw dvben50221 ) )"

CONFIG_CHECK="~INOTIFY_USER"

DOCS=( README.md )

pkg_setup() {
	enewuser tvheadend -1 -1 /dev/null video
}

src_prepare() {
    # epatch "${FILESDIR}/${PN}-${PV}-configure.patch"
    eapply_user
}

src_configure() {
	local myconf=""

	# these are only used with static ffmpeg, which I disabled
       # uses="aac theora vorbis vpx x264 x265"
	#for i in ${uses}; do
	#	use ${i} || myconf+=" --disable-${i}"
	#done

# dvbcsa not in main tree
#		$(use_enable dvbcsa) \

	econf --prefix="${EPREFIX}"/usr \
		--datadir="${EPREFIX}"/usr/share \
		--disable-hdhomerun_static \
		--disable-ffmpeg_static \
		--disable-libx264_static \
		--disable-libx264 \
		--disable-libx265_static \
		--disable-libx265 \
		--disable-libvpx_static \
		--disable-libvpx \
		--disable-libvorbis_static \
		--disable-libvorbis \
		--disable-libfdkaac_static \
		--disable-libfdkaac \
		--disable-libtheora_static \
		--disable-libtheora \
		--disable-ccache \
		--disable-dvbscan \
		$(use_enable avahi) \
		$(use_enable bundle) \
		$(use_enable cwc cwc) \
		$(use_enable capmt capmt) \
		$(use_enable constcw constcw) \
		$(use_enable dbus dbus_1) \
		$(use_enable dvb linuxdvb) \
		$(use_enable dvbcsa) \
		$(use_enable dvben50221) \
		$(use_enable ffmpeg libav) \
		$(use_enable hdhomerun hdhomerun_client) \
		$(use_enable imagecache) \
		$(use_enable inotify) \
		# $(use_enable iptv) \
		$(use_enable satip satip_server) \
		$(use_enable satip satip_client) \
		$(use_enable systemd libsystemd_daemon) \
		$(use_enable timeshift) \
		$(use_enable uriparser) \
		$(use_enable zlib)
}

src_compile() {
	emake CC="$(tc-getCC)"
}

src_install() {
	default

	newinitd "${FILESDIR}/tvheadend.initd" tvheadend
	newconfd "${FILESDIR}/tvheadend.confd" tvheadend

	systemd_dounit "${FILESDIR}/tvheadend.service"

	dodir /etc/tvheadend
	fperms 0700 /etc/tvheadend
	fowners tvheadend:video /etc/tvheadend
}

pkg_postinst() {
	elog "The Tvheadend web interface can be reached at:"
	elog "http://localhost:9981/"
	elog
	elog "Make sure that you change the default username"
	elog "and password via the Configuration / Access control"
	elog "tab in the web interface."
}
