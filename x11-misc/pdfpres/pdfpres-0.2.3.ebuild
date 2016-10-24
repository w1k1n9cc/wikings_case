# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python{2_6,2_7} )

inherit python-r1

MY_PN=pdfPres

DESCRIPTION="Dual head PDF presenter"
HOMEPAGE="http://www.uninformativ.de/projects/?q=pdfpres"
SRC_URI="https://github.com/vain/${PN}/archive/${P}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="${PYTHON_DEPS}"
DEPEND="${RDEPEND}"

S=${WORKDIR}/${MY_PN}-${P}

src_install() {
	dodoc README

	python_foreach_impl python_newscript legacy-notes-converter.py ${PN}-legacy-notes-converter

	#python_foreach_impl python_doscript ${PN}
	dobin ${PN}
	doman man1/${PN}.1
}
