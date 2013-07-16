# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit games git-2

DESCRIPTION="Jorgen cowsay"
HOMEPAGE="https://github.com/daktak/jorgen_say"
EGIT_REPO_URI="https://github.com/daktak/jorgen_say.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="games-misc/cowsay
		games-misc/fortune-mod"
RDEPEND="${DEPEND}"


src_install () {
	COWV=`equery list --format='$name-$version' cowsay`
	insinto /usr/share/fortune
	doins jorgen
	doins jorgen.dat || die
	insinto /usr/share/${COWV}/cows
	doins jorgen.cow || die
	dobin jorgen.sh || die
}
