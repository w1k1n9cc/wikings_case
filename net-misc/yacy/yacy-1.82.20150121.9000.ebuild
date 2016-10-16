# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils java-pkg-2 java-ant-2 systemd versionator user

MAJOR_PV="$(get_version_component_range 1-2)"
REL_PV="$(get_version_component_range 3)"
SVN_PV="$(get_version_component_range 4)"

DESCRIPTION="YaCy - p2p based distributed web-search engine"
HOMEPAGE="http://www.yacy.net/"
SRC_URI="http://www.yacy.net/release/yacy_v${MAJOR_PV}_${REL_PV}_${SVN_PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86 ppc"
IUSE="systemd"

DEPEND=">=virtual/jdk-1.7"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}"

EANT_BUILD_TARGET="all"

pkg_setup() {
	enewgroup yacy
	enewuser yacy -1 -1 /var/lib/yacy yacy
}

#src_prepare() {
#	epatch "${FILESDIR}/remove_timeout.patch"
#}

src_install() {
	# remove win-only stuff
	find "$S" -name "*.bat" -exec rm '{}' \; || die
	# remove init-scripts
	rm "${S}"/*.sh || die
	# remove sources
	rm -r "${S}/source" || die
	rm "${S}"/build.properties "${S}"/build.xml || die

	local docs="AUTHORS COPYRIGHT NOTICE gpl.txt readme.txt"
	for doc in $docs; do
		dodoc $doc
		rm $doc
	done

	rm lib/*License || die
	rmdir DATA || die

	local yacy_home="${EROOT}usr/share/${PN}"
	dodir ${yacy_home}
	cp -r "${S}"/* "${D}${yacy_home}" || die

	dodir /var/lib/yacy
	fowners yacy:yacy /var/lib/yacy

	dosym /var/lib/yacy /${yacy_home}/DATA

	if use systemd; then
		systemd_dounit "${FILESDIR}"/${PN}.service
	fi
	newinitd "${FILESDIR}"/${PN}.initd $PN
	newconfd "${FILESDIR}"/${PN}.confd $PN
}

pkg_postinst() {
	einfo "yacy.logging will write logfiles into /var/lib/yacy/LOG"
	einfo "To setup YaCy, open http://localhost:8090 in your browser."
}