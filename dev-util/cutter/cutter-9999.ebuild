# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit qmake-utils git-r3 xdg-utils gnome2-utils

DESCRIPTION="A Qt and C++ GUI for radare2 reverse engineering framework"
HOMEPAGE="http://www.radare.org"
EGIT_REPO_URI="https://github.com/radareorg/cutter.git"

EGIT_SUBMODULES=( -radare2 )

LICENSE="GPL-3"
SLOT="0"
IUSE="jupyter webengine"
REQUIRED_USE="webengine? ( jupyter )"

DEPEND="
	>=dev-qt/qtcore-5.9.1:5
	>=dev-qt/qtgui-5.9.1:5
	>=dev-qt/qtsvg-5.9.1:5
	>=dev-qt/qtwidgets-5.9.1:5
	>=dev-util/radare2-9999
	jupyter? ( dev-python/jupyter )
	webengine? ( >=dev-qt/qtwebengine-5.9.1:5[widgets] )
"

RDEPEND="${DEPEND}"

PATCHES=(
        "${FILESDIR}/${P}-python3-config.patch"
)

src_configure() {
	local myqmakeargs=(
		CUTTER_ENABLE_JUPYTER=$(usex jupyter true false)
		CUTTER_ENABLE_QTWEBENGINE=$(usex webengine true false)
		PREFIX=\'${EPREFIX}/usr\'
	)

	eqmake5 "${myqmakeargs[@]}" src
}

src_install() {
	emake INSTALL_ROOT="${D}" install
}

dpkg_postinst() {
	xdg_desktop_database_update
	gnome2_icon_cache_update
}

pkg_postrm() {
	xdg_desktop_database_update
	gnome2_icon_cache_update
}
