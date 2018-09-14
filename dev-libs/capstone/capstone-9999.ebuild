# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DISTUTILS_OPTIONAL=1
PYTHON_COMPAT=( python{2_7,3_6} )
inherit cmake-utils git-r3 distutils-r1 toolchain-funcs

DESCRIPTION="disassembly/disassembler framework + bindings"
HOMEPAGE="http://www.capstone-engine.org/"
EGIT_REPO_URI="https://github.com/aquynh/capstone.git"

LICENSE="BSD"
SLOT="0/3" # libcapstone.so.3
KEYWORDS="~amd64 ~arm ~x86"

IUSE="python"
IUSE="python"
RDEPEND="python? ( ${PYTHON_DEPS} )"
DEPEND="${RDEPEND}
	python? ( dev-python/setuptools[${PYTHON_USEDEP}] )
"
REQUIRED_USE="python? ( ${PYTHON_REQUIRED_USE} )"

S=${WORKDIR}/${P/_rc/-rc}

wrap_python() {
	if use python; then
		pushd bindings/python >/dev/null || die
		distutils-r1_${1} "$@"
		popd >/dev/null
	fi
}

src_prepare() {
	cmake-utils_src_prepare

	wrap_python ${FUNCNAME}
}

src_configure() {
	{
		cat <<-EOF
		# Gentoo overrides:
		#   verbose build
		V = 1
		#   toolchain
		AR = $(tc-getAR)
		CC = $(tc-getCC)
		RANLIB = $(tc-getRANLIB)
		#  toolchain flags
		CFLAGS = ${CFLAGS}
		LDFLAGS = ${LDFLAGS}
		#  libs
		LIBDIRARCH = $(get_libdir)
		EOF
	} >> config.mk || die
	cmake-utils_src_configure
	wrap_python ${FUNCNAME}
}

src_compile() {
	cmake-utils_src_compile

	wrap_python ${FUNCNAME}
}

src_test() {
	cmake-utils_src_test

	wrap_python ${FUNCNAME}
}

src_install() {
	cmake-utils_src_install

	wrap_python ${FUNCNAME}
}
