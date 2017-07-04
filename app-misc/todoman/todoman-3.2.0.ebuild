# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6
PYTHON_COMPAT=( python3_{3,4,5} )

SCM=""
if [ "${PV#9999}" != "${PV}" ] ; then
	SCM="git-r3"
	EGIT_REPO_URI= "https://github.com/pimutils/todoman"
fi

inherit ${SCM} distutils-r1

DESCRIPTION="A simple CalDAV-based todo manager"
HOMEPAGE="https://github.com/pimutils/todoman"
if [ "${PV#9999}" != "${PV}" ] ; then
	SRC_URI=""
	KEYWORDS=""
else
	SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="GPL-3"
SLOT="0"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
		dev-python/pytest-runner[${PYTHON_USEDEP}]"
RDEPEND="dev-python/atomicwrites[${PYTHON_USEDEP}]
	>=dev-python/click-6.0[${PYTHON_USEDEP}]
	>=dev-python/click-log-0.1.3[${PYTHON_USEDEP}]
	dev-python/configobj[${PYTHON_USEDEP}]
	dev-python/humanize[${PYTHON_USEDEP}]
	dev-python/icalendar[${PYTHON_USEDEP}]
	dev-python/parsedatetime[${PYTHON_USEDEP}]
	dev-python/python-dateutil[${PYTHON_USEDEP}]
	dev-python/pyxdg[${PYTHON_USEDEP}]
	dev-python/tabulate[${PYTHON_USEDEP}]
	dev-python/urwid[${PYTHON_USEDEP}]"

DOCS=( AUTHORS.rst CHANGELOG.rst README.rst todoman.conf.sample )

src_install() {
	distutils-r1_src_install
	# suggested from install instructions for installation with
	# setup.py install
	exeinto /usr/bin
	doexe bin/todo
}
