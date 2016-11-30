# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

PYTHON_COMPAT=( python2_7  )
inherit git-r3 distutils-r1

EGIT_REPO_URI="https://github.com/sagark/thinkdisp.git"
EGIT_BRANCH="master"

DESCRIPTION="Display Manager/Unity Panel Indicator for Ubuntu+Bumblebee+Multimon"
HOMEPAGE="http://sagark.org/thinkdisp/"
LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
        ${PYTHON_DEPS}
	=dev-libs/libappindicator-12.10.0-r201[python]
	dev-libs/libappindicator[python]
	dev-python/configparser"

# src_unpack() {
	# git-2_src_unpack
	# cd $EGIT_SOURCEDIR
	# git submodule update --init --recursive
# }

src_compile() {
	# normal src_install for killdisp
	default
	# and now can the python stuff start
	distutils-r1_src_install
}

