TERMUX_PKG_HOMEPAGE=https://lxqt.github.io
TERMUX_PKG_DESCRIPTION="Tools to set global keyboard shortcuts in LXQt sessions"
TERMUX_PKG_LICENSE="LGPL-2.1"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION="2.0.0"
TERMUX_PKG_SRCURL="https://github.com/lxqt/lxqt-globalkeys/releases/download/${TERMUX_PKG_VERSION}/lxqt-globalkeys-${TERMUX_PKG_VERSION}.tar.xz"
TERMUX_PKG_SHA256=13e7a72686890a40b65d8ae13c79ed287eb971fbc0285769c40c8b97e7af43f7
TERMUX_PKG_DEPENDS="libc++, liblxqt, libx11, qt6-qtbase"
TERMUX_PKG_BUILD_DEPENDS="lxqt-build-tools, qt6-qttools"
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
-DQt6LinguistTools_DIR=${TERMUX_PREFIX}/opt/qt6/cross/lib/cmake/Qt6LinguistTools
"
