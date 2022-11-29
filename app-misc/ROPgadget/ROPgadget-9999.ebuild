# Copyright 2020-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{8,9,10,11} )

inherit distutils-r1 git-r3

DESCRIPTION="Tool to search for gadgets in binaries to facilitate your ROP exploitation"
HOMEPAGE="http://shell-storm.org/project/ROPgadget/"
EGIT_REPO_URI="https://github.com/JonathanSalwan/ROPgadget.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-libs/capstone"
RDEPEND="${DEPEND}"
