# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

PYTHON_COMPAT=( python{2_7,3_4,3_5} )

inherit distutils-r1

DESCRIPTION="Module for decoding audio files using whichever backend is available"
HOMEPAGE="https://pypi.python.org/pypi/audioread"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="|| ( dev-python/gst-python:0.10[${PYTHON_USEDEP}] dev-python/pymad media-video/ffmpeg )"
