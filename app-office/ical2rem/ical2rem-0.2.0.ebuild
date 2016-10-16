# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21"
RUBY_FAKEGEM_NAME="${PN}.rb"
RUBY_FAKEGEM_EXTRAINSTALL=".ical2rem.yaml"

inherit ruby-fakegem
#EGIT_REPO_URI="https://github.com/courts/ical2rem.rb.git"
DESCRIPTION="Ruby script to convert iCal to Rem files"
HOMEPAGE="https://github.com/courts/ical2rem.rb"
#SRC_URI=""
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
DEPEND="dev-ruby/ri_cal"
RDEPEND="${DEPEND}"


#src_compile() {
#	gem build ${PN}.rb.gemspec
#}
#
#src_install() {
#	#gem install -i /usr/lib/ruby/gems -n $D ${PN}.rb-${PV}.gem
#	PREFIX="$D"
#	gem install ${PN}.rb-${PV}.gem 
#}
