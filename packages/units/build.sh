TERMUX_PKG_HOMEPAGE=https://www.gnu.org/software/units/
TERMUX_PKG_DESCRIPTION="Converts between different systems of units"
TERMUX_PKG_LICENSE="GPL-3.0"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=2.23
TERMUX_PKG_REVISION=1
TERMUX_PKG_SRCURL=https://mirrors.kernel.org/gnu/units/units-${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=d957b451245925c9e614c4513397449630eaf92bd62b8495ba09bbe351a17370
TERMUX_PKG_DEPENDS="readline"
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
--sharedstatedir=$TERMUX_PREFIX/var/lib
"
