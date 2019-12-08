# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 python3_{6,7} )

inherit distutils-r1 git-r3

DESCRIPTION="Pwntools is a CTF framework and exploit development library."
HOMEPAGE="https://github.com/Gallopsled/pwntools#readme"
EGIT_REPO_URI="https://github.com/Gallopsled/pwntools.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="dev-lang/python
		>=dev-python/paramiko-1.15.2[${PYTHON_USEDEP}]
		>=dev-python/mako-1.0.0[${PYTHON_USEDEP}]
		>=dev-python/pyelftools-0.2.4[${PYTHON_USEDEP}]
		dev-libs/capstone[python,${PYTHON_USEDEP}]
		>=app-misc/ROPgadget-5.3[${PYTHON_USEDEP}]
		>=dev-python/pyserial-2.7[${PYTHON_USEDEP}]
		>=dev-python/requests-2.0.0[${PYTHON_USEDEP}]
		>=dev-python/pip-6.0.8[${PYTHON_USEDEP}]
		>=dev-python/tox-1.8.1[${PYTHON_USEDEP}]
		>=dev-python/pygments-2.0[${PYTHON_USEDEP}]
		dev-python/PySocks[${PYTHON_USEDEP}]
		dev-python/python-dateutil[${PYTHON_USEDEP}]
		dev-python/packaging[${PYTHON_USEDEP}]
		>=dev-python/psutil-3.3.0[${PYTHON_USEDEP}]
		>=dev-python/intervaltree-3.0[${PYTHON_USEDEP}]
		dev-libs/unicorn-bindings[python,${PYTHON_USEDEP}]
		dev-python/sortedcontainers[${PYTHON_USEDEP}]"
