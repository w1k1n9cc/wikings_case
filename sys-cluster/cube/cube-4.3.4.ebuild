# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="performance report explorer for Scalasca and Score-P"
HOMEPAGE="http://www.scalasca.org/software/cube-4.x/download.html"
SRC_URI="http://apps.fz-juelich.de/scalasca/releases/${PN}/4.3/dist/${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+shared -static"

DEPEND="sys-libs/zlib
		dev-lang/perl
		>=dev-qt/qtcore-4.6.0"
RDEPEND="${DEPEND}"

src_configure() {
	if [[ -x ${ECONF_SOURCE:-.}/configure  ]] ; then
		# build with static and shared libs
		econf \
			$(use_enable static) \
			$(use_enable shared)
	fi

	# replace -isystem flags von QT_CPPFLAGS with the right -I flag for moc and
	# qmake otherwise we get an compile error
	# use perl for substitute over multiple lines
	grep -rl isys | xargs perl -0777 -i -pe 's:isys"\\\n"tem:I"\\\n":igs; s/isystem/I/g'
}

src_install() {
# create usr/bin because cube don't do it on his own
	mkdir -p ${D}/usr/bin

	if [ -f Makefile ] || [ -f GNUmakefile] || [ -f makefile ] ; then
		emake DESTDIR="${D}" install
	fi

	if ! declare -p DOCS >/dev/null 2>&1 ; then
		local d
		for d in README* ChangeLog AUTHORS NEWS TODO CHANGES THANKS BUGS \
				FAQ CREDITS CHANGELOG ; do
			[[ -s "${d}" ]] && dodoc "${d}"
		done
	elif declare -p DOCS | grep -q "^declare -a " ; then
		dodoc "${DOCS[@]}"
	else
		dodoc ${DOCS}
	fi
}
