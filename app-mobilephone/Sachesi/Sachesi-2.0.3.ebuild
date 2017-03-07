# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit qmake-utils

DESCRIPTION="Firmware, extractor, searcher and installer for Blackberry 10"
HOMEPAGE="https://github.com/xsacha/Sachesii"
SRC_URI=" https://github.com/xsacha/Sachesi/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+shared_lzo +shared_quazip"

DEPEND=">=dev-qt/qtcore-5.0.0
		>=dev-qt/qtdeclarative-5.0.0[xml]
		dev-qt/qtquickcontrols
		shared_lzo? ( dev-libs/lzo )
		shared_quazip? ( dev-libs/quazip[qt5] )"
RDEPEND="${DEPEND}"

DOCS=(README.md)

src_configure() {
	CONFIGQ=""
	if use shared_lzo; then
		CONFIGQ+="shared_lzo "
	fi
	if use shared_quazip; then
		CONFIGQ+="shared_quazip "
	fi
		
	eqmake5 CONFIG+="$CONFIGQ"
}

src_install() {
	dobin Sachesi
        einstalldocs
}
