# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit linux-mod eutils

DESCRIPTION="Userspace tools for cameras based on Ricoh R5U87x chipsets."
HOMEPAGE="https://github.com/3pei/r5u870/"
SRC_URI="https://github.com/3pei/r5u870/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="virtual/libusb
        >=dev-libs/glib-2.16"
RDEPEND="${DEPEND}"

S="${S}/r5u870"
pkg_setup() {
  linux-mod_pkg_setup

  linux_config_exists || die "Your kernel sources are unconfigured"

  BUILD_TARGETS="clean all"
  MODULE_NAMES="r5u870(:${S}:${S}"
}

src_compile () {
  linux-mod_src_compile
  MODULE_NAMES="${MODULE_NAMES} usbcam(:${S}/usbcam:${S}/usbcam)"
}

src_install ()
{
  cd "r5u870"
		
  insinto /lib/firmware
  doins r5u870_*.fw
  doins recode-fw.scm

  # Module installieren
  #usbcam/usbcam.ko
  #r5u870.ko

  linux-mod_src_install
}
