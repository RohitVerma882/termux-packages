TERMUX_PKG_HOMEPAGE="https://github.com/bootandy/dust"
TERMUX_PKG_DESCRIPTION="A more intuitive version of du in rust"
TERMUX_PKG_LICENSE="Apache-2.0"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION="1.1.2"
TERMUX_PKG_SRCURL=https://github.com/bootandy/dust/archive/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=31da99483ee6110d43ed5e7c56a59f40f33b389e45d09d91fca022b42d442040
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_post_make_install() {
	install -Dm644 "completions/${TERMUX_PKG_NAME}.bash" "${TERMUX_PREFIX}/share/bash-completion/completions/${TERMUX_PKG_NAME}"
	install -Dm644 "completions/${TERMUX_PKG_NAME}.fish" "${TERMUX_PREFIX}/share/fish/vendor_completions.d/${TERMUX_PKG_NAME}.fish"
	install -Dm644 "completions/_${TERMUX_PKG_NAME}" "${TERMUX_PREFIX}/share/zsh/site-functions/_${TERMUX_PKG_NAME}"
	install -Dm644 "man-page/${TERMUX_PKG_NAME}.1" "${TERMUX_PREFIX}/share/man/man1/${TERMUX_PKG_NAME}.1"
}
