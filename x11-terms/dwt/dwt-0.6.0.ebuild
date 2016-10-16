# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="Simple no-frills terminal emulator using VTE -- for (x)dwm"
HOMEPAGE="https://github.com/aperezdc/dwt"
SRC_URI="https://github.com/aperezdc/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="x86 amd64 ppc"
IUSE=""

RDEPEND=">=dev-libs/glib-2
		x11-libs/gtk+:3
		x11-libs/vte:2.91"
DEPEND="${RDEPEND}
		virtual/pkgconfig"
