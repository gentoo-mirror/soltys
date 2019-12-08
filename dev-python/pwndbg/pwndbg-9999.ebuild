# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python{2_7,3_6,3_7} )

inherit python-single-r1 git-r3

DESCRIPTION="Makes debugging with GDB suck less"
HOMEPAGE="https://github.com/pwndbg/pwndbg"
EGIT_REPO_URI="https://github.com/pwndbg/pwndbg.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="dev-lang/python
		sys-devel/gdb[python,${PYTHON_USEDEP}]
		dev-python/future[${PYTHON_USEDEP}]
		dev-python/isort[${PYTHON_USEDEP}]
		dev-python/pyelftools[${PYTHON_USEDEP}]
		~dev-libs/capstone-4.0.1[python,${PYTHON_USEDEP}]
		app-misc/ROPgadget[${PYTHON_USEDEP}]
		dev-python/pip[${PYTHON_USEDEP}]
		dev-python/pygments[${PYTHON_USEDEP}]
		>=dev-python/psutil-3.1.0[${PYTHON_USEDEP}]
		>=dev-libs/unicorn-bindings-1.0.0[python,${PYTHON_USEDEP}]
		dev-python/pycparser[${PYTHON_USEDEP}]
		dev-python/six[${PYTHON_USEDEP}]
		python_targets_python2_7? (
		dev-python/enum34
	)
		dev-python/pytest[${PYTHON_USEDEP}]"

src_prepare() {
	sed '/0L/d' -i ida_script.py
	eapply_user
}

src_compile() {
	einfo "Nothing to compile"
}

src_install() {
	insinto "/usr/share/${PN}"
	doins -r *.py pwndbg
	insinto "/usr/share/doc/${PF}"
	doins *.md
}

pkg_postinst() {
	readme.gentoo_print_elog

	elog "To use ${PN} you have to add this to your ~/.gdbinit"
	elog "source /usr/share/${PN}/gdbinit.py"
	elog "You can simply execute:"
	elog "echo \"source /usr/share/${PN}/gdbinit.py\" >> ~/.gdbinit"
}
