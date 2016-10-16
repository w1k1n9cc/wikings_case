# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit golang-build

DESCRIPTION="Tools to work with Ubuntu Touch"
HOMEPAGE="https://launchpad.net/goget-ubuntu-touch"
SRC_URI="https://launchpad.net/ubuntu/+archive/primary/+files/goget-ubuntu-touch_${PV}.orig.tar.gz"

LICENSE="GPL3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-util/android-tools"
RDEPEND="${DEPEND}"

S=${WORKDIR}/goget-ubuntu-touch-${PV}/${PN}

src_prepare() {
	export GOPATH="${WORKDIR}/build"

	# download deps
	go get -v -d
}

src_compile() {
	# Prepare executable
	go build
}

src_install() {
	SOURCE_PATH="${WORKDIR}/goget-ubuntu-touch-${PV}"

	# Package license (if available)
	install -Dm644 "$SOURCE_PATH/COPYING" \
		"${D}/usr/share/licenses/${PN}/COPYING"

	# Package executables
	install -Dm755 "$SOURCE_PATH/${PN}/${PN}${pkgname}" \
		"${D}/usr/bin/${PN}"
}
