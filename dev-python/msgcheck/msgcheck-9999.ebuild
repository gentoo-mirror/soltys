# Copyright 2019-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{9,10,11} )

inherit distutils-r1 git-r3

DESCRIPTION="Gettext file checker"
HOMEPAGE="https://github.com/flashcode/msgcheck/"
EGIT_REPO_URI="https://github.com/flashcode/msgcheck.git"

LICENSE="GPL-3"
SLOT="0"
DEPEND="sys-devel/gettext
dev-python/pyenchant"
