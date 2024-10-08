TERMUX_PKG_HOMEPAGE=https://github.com/tdlib/telegram-bot-api
TERMUX_PKG_DESCRIPTION="Telegram Bot API server"
TERMUX_PKG_LICENSE="BSL-1.0"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_SRCURL=git+https://github.com/tdlib/telegram-bot-api
_COMMIT=12bbe26692b8c6e347aaf3e32e0e9d11b86bb56d
_COMMIT_DATE=2024.07.30
TERMUX_PKG_VERSION=${_COMMIT_DATE//./}
TERMUX_PKG_SHA256=6c0dddef10c0e1050a0f9840895d71830a867bb1932cd150d1d56b1e9510fc18
TERMUX_PKG_AUTO_UPDATE=false
TERMUX_PKG_GIT_BRANCH=master
TERMUX_PKG_HOSTBUILD=true
TERMUX_PKG_DEPENDS="libc++, openssl, zlib"

termux_step_get_source() {
	rm -rf $TERMUX_PKG_SRCDIR
	mkdir -p $TERMUX_PKG_SRCDIR
	cd $TERMUX_PKG_SRCDIR
	git clone --depth 1 --branch ${TERMUX_PKG_GIT_BRANCH} \
		${TERMUX_PKG_SRCURL#git+} .
	git fetch --unshallow
	git checkout $_COMMIT
	git submodule update --init --recursive --depth=1
}

termux_step_post_get_source() {
	local version="$(git log -1 --format=%cs | sed 's/-//g')"
	if [ "$version" != "$TERMUX_PKG_VERSION" ]; then
		echo -n "ERROR: The specified version \"$TERMUX_PKG_VERSION\""
		echo " is different from what is expected to be: \"$version\""
		return 1
	fi

	local s=$(find . -type f ! -path '*/.git/*' -print0 | xargs -0 sha256sum | LC_ALL=C sort | sha256sum)
	if [[ "${s}" != "${TERMUX_PKG_SHA256}  "* ]]; then
		termux_error_exit "Checksum mismatch for source files."
	fi
}

termux_step_pre_configure() {
	# hostbuild step have to be run everytime
	rm -Rf $TERMUX_PKG_HOSTBUILD_DIR
}

termux_step_host_build() {
	termux_setup_cmake
	cmake "-DCMAKE_BUILD_TYPE=Release" "$TERMUX_PKG_SRCDIR"
	cmake --build . --target prepare_cross_compiling
}
