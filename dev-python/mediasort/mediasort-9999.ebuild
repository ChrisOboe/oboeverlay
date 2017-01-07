# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python3_{3,4,5} )

inherit distutils-r1 git-r3

DESCRIPTION="A library for automaticly sorting mediafiles"
HOMEPAGE="https://github.com/ChrisOboe/mediasort"
EGIT_REPO_URI="https://github.com/ChrisOboe/mediasort.git"

LICENSE="GPL-3"
SLOT="0"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="
	dev-python/guessit[${PYTHON_USEDEP}]
	dev-python/tmdbsimple[${PYTHON_USEDEP}]
	dev-python/python-dateutil[${PYTHON_USEDEP}]"
