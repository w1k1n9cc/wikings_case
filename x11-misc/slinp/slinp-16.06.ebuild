# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

PYTHON_COMPAT=( python{3_3,3_4} )
inherit python-any-r1

DESCRIPTION="PDF presentation tool chest, successor to x11-misc/pdfpres"
HOMEPAGE="http://www.uninformativ.de/projects/?q=slinp"
SRC_URI="https://github.com/vain/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="PIZZA-WARE-42"
SLOT="0"
KEYWORDS="amd64 x86 ppc"
IUSE=""

DEPEND="app-text/poppler
	x11-libs/gtk+:3"
RDEPEND="${DEPEND}
	${PYTHON_DEPS}
	sys-apps/sed"

src_install() {
	emake DESTDIR="${D}" prefix=/usr install
	dodoc README.md
}
