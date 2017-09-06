# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6
inherit cmake-utils git-r3

DESCRIPTION="New open source tool for binary data analysis"
SLOT="0"

HOMEPAGE="https://codisec.com/veles/"

EGIT_REPO_URI="https://github.com/codilime/veles.git"

LICENSE="Apache-2.0"

KEYWORDS="~amd64"

DEPEND="sys-libs/zlib
	>=dev-util/cmake-3.1.0
	>=dev-qt/qtgui-5.5
	>=dev-qt/qtcore-5.5
	>=dev-qt/qtwidgets-5.5
	"
