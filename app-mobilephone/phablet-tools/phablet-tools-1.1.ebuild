# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

MY_PV="1.1+14.10.20141010"

DESCRIPTION="Scripts to work with Phablet. Installs Touch Developer Preview on Nexus devices"
HOMEPAGE="https://launchpad.net/phablet-tools"
SRC_URI="https://launchpad.net/ubuntu/+archive/primary/+files/${PN}_${MY_PV}.orig.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="dev-python/configobj[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-util/android-tools"
	#dev-util/android-sdk-update-manager"

S="${WORKDIR}/${PN}-${MY_PV}"

src_prepare() {
	distutils-r1_src_prepare
	# sed -i \
	# 	-e "s/'repo',//" \
	# 	-e "s/'phablet-dev-bootstrap',//" \
	# 	setup.py || die "error excluding dev tools"

	# sed -i 's/python/python2.7/g' phabletutils/settings.py
}

# python2 setup.py install --root=
# mv $pkgdir/usr/bin/repo $pkgdir/usr/bin/repo.phablet-tools
