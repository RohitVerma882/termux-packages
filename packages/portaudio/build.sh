TERMUX_PKG_HOMEPAGE=https://www.portaudio.com/
TERMUX_PKG_DESCRIPTION="A portable audio I/O library"
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_LICENSE_FILE="LICENSE.txt"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=19.07.00
TERMUX_PKG_REVISION=1
_DATE=20210406
TERMUX_PKG_SRCURL=https://files.portaudio.com/archives/pa_stable_v${TERMUX_PKG_VERSION//./}_${_DATE}.tgz
TERMUX_PKG_SHA256=47efbf42c77c19a05d22e627d42873e991ec0c1357219c0d74ce6a2948cb2def
TERMUX_PKG_AUTO_UPDATE=false
TERMUX_PKG_DEPENDS="libc++"
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
--enable-cxx
--without-alsa
--without-jack
--without-oss
--without-asihpi
ac_cv_lib_pthread_pthread_create=yes
ac_cv_lib_rt_clock_gettime=yes
"
TERMUX_PKG_MAKE_PROCESSES=1
