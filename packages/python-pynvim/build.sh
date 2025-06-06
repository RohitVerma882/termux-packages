TERMUX_PKG_HOMEPAGE=https://github.com/neovim/pynvim
TERMUX_PKG_DESCRIPTION="Python client for Neovim"
TERMUX_PKG_LICENSE="Apache-2.0"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=0.5.2
TERMUX_PKG_SRCURL=https://github.com/neovim/pynvim/archive/refs/tags/${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=c86e304d55fc8996296554b959cad483aeaafb47e425ebe3a7d0f96e3222f035
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_DEPENDS="python-greenlet, python-msgpack"
TERMUX_PKG_PYTHON_BUILD_DEPS="wheel"
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_PLATFORM_INDEPENDENT=true
