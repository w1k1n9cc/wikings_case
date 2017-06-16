# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="a highly scalable, memory efficient event trace data format plus support library"
HOMEPAGE="http://www.vi-hps.org/projects/score-p/"
SRC_URI="http://www.vi-hps.org/upload/packages/${PN}/${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+shared -static"

DEPEND=""
RDEPEND="${DEPEND}"

src_configure() {
	# build with static and shared libs
	econf \
		$(use_enable static) \
		$(use_enable shared)
}
