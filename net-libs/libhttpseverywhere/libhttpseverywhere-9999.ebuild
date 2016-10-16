# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

# Created by Peter Huewe

EAPI=5
inherit eutils
inherit git-r3
inherit cmake-utils
DESCRIPTION="library to use HTTPSEverywhere in desktop applications"
HOMEPAGE="https://github.com/grindhold/libhttpseverywhere"
CMAKE_IN_SOURCE_BUILD="1"
EGIT_REPO_URI="https://github.com/grindhold/libhttpseverywhere.git"
KEYWORDS="~x86 ~amd64"
LICENSE="GPL-3"
SLOT="0"

DEPEND="
	=dev-lang/vala-0.26.2
	dev-libs/libgee:0.8[introspection]
	dev-util/pkgconfig
	>=dev-util/cmake-2.6
	dev-libs/glib
	"

RDEPEND="${DEPEND}"
