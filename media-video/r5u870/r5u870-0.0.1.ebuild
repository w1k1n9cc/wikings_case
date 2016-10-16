# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit linux-mod mercurial eutils

DESCRIPTION="Userspace tools for cameras based on Ricoh R5U87x chipsets."
HOMEPAGE="http://bitbucket.org/ahixon/r5u87x/overview/"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=">=dev-libs/libusb-0.1.12
        >=dev-libs/glib-2.16"
RDEPEND="${DEPEND}"

src_unpack () {
  EHG_PULL_CMD=/bin/true
# EHG_CLONE_CMD=/bin/true
  EHG_REPO_URI="http://bitbucket.org/ahixon/r5u87x/"
  mercurial_src_unpack
}

src_compile () {
  cd "${WORKDIR}/r5u87x"
  emake CFLAGS="${CFLAGS}" LDFLAGS="${LDFLAGS}"
}

src_install ()
{
  cd "${WORKDIR}/r5u87x"

        dodoc README docs/*.txt

        exeinto "/usr/$(get_libdir)/${PN}"
        doexe loader

        insinto "/usr/$(get_libdir)/${PN}/ucode"
        doins ucode/*.fw
}
