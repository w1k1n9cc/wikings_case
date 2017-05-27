# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="contains the code instrumentation functionality supporting various methods and it performs the run-time data collection in the parallel environment"
HOMEPAGE="http://www.vi-hps.org/projects/score-p/"
SRC_URI="http://www.vi-hps.org/upload/packages/${PN}/${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+shared -opari2 -otf2 -cube -static"

DEPEND="opari2? ( !sys-cluser/opari2 )
		!opari2? ( !sys-cluster/opari2 )
		otf2? ( sys-cluser/otf2 )
		!otf2? ( !sys-cluster/otf2 )
		cube? ( sys-cluser/cube )
		!cube? ( !sys-cluster/cube )"
RDEPEND="${DEPEND}"

src_configure() {
	# build with static and shared libs
	econf \
		$(use_enable static) \
		$(use_enable shared) \
		$(use_with opari2) \
		$(use_with otf2) \
		$(use_with cube)
}
