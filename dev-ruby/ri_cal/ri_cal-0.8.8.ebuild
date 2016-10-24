# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21"
inherit ruby-fakegem
DESCRIPTION="RiCal is a new Ruby Library for parsing, generating, and using iCalendar (RFC 2445) format data."
HOMEPAGE="https://github.com/rubyredrick/ri_cal"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
DEPEND="dev-ruby/tzinfo"
RDEPEND="${DEPEND}"

