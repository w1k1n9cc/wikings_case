# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="weather-aware desktop background images"
HOMEPAGE="https://onli.github.io/izulu/"
SRC_URI="https://github.com/onli/izulu/archive/${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="media-gfx/imagemagick
    dev-perl/XML-Twig
    app-misc/jq
    sys-devel/bc"

# izulu uses a simple makefile without the configure step
src_configure() {
    :
}
