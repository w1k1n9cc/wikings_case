# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="This is a Perl script that extracts URLs from correctly-encoded MIME email messages or plain text"
HOMEPAGE="http://www.memoryhole.net/~kyle/extract_url/"
SRC_URI="https://github.com/m3m0ryh0l3/${PN}/archive/v${PV}.tar.gz"


LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-perl/MIME-tools
		dev-perl/HTML-Parser
		virtual/perl-Pod-Simple
		dev-perl/Shell-EnvImporter
		virtual/perl-MIME-Base64
		dev-perl/URI-Find
		dev-perl/Curses-UI
		virtual/perl-Getopt-Long"
RDEPEND="${DEPEND}"

