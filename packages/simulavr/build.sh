TERMUX_PKG_HOMEPAGE="https://www.nongnu.org/simulavr"
TERMUX_PKG_DESCRIPTION="Simulator for Microchip AVR (formerly Atmel) microcontrollers"
TERMUX_PKG_LICENSE="GPL-2.0"
TERMUX_PKG_MAINTAINER="@termux"
_VERSION_MAJOR=1
_VERSION_MINOR=1
_VERSION_PATCH=0
TERMUX_PKG_VERSION=${_VERSION_MAJOR}.${_VERSION_MINOR}.${_VERSION_PATCH}
TERMUX_PKG_REVISION=2
TERMUX_PKG_SRCURL="git+https://git.savannah.nongnu.org/git/simulavr"
TERMUX_PKG_GIT_BRANCH=release-${TERMUX_PKG_VERSION}
TERMUX_PKG_DEPENDS="libc++"
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_EXTRA_CONFIGURE_ARGS='
-DBUILD_TCL=OFF
-DBUILD_PYTHON=OFF
-DBUILD_VERILOG=OFF
-DCHECK_VALGRIND=OFF
'

termux_step_post_get_source() {
	echo "Applying hardcode-version.diff"
	sed \
		-e "s|@VERSION_MAJOR@|${_VERSION_MAJOR}|g" \
		-e "s|@VERSION_MINOR@|${_VERSION_MINOR}|g" \
		-e "s|@VERSION_PATCH@|${_VERSION_PATCH}|g" \
		$TERMUX_PKG_BUILDER_DIR/hardcode-version.diff \
		| patch --silent -p1
}

termux_step_make_install() {
	install -DTm755 "$TERMUX_PKG_BUILDDIR"/app/"$TERMUX_PKG_NAME" \
		"$TERMUX_PREFIX"/bin/"$TERMUX_PKG_NAME"
	install -Dm644 "$TERMUX_PKG_BUILDDIR"/libsim/libsim.so \
		-t "$TERMUX_PREFIX"/lib/
	install -Dm644 "$TERMUX_PKG_BUILDDIR"/doc/{copyright,SUPPORT,AUTHORS,README.gdb,NEWS,TODO,README} \
		-t "$TERMUX_PREFIX"/share/doc/"$TERMUX_PKG_NAME"
	install -DTm644 "$TERMUX_PKG_BUILDDIR"/doc/COPYING \
		"$TERMUX_PREFIX"/share/doc/"$TERMUX_PKG_NAME"/LICENSE
	# Headers are moved into their own subdirectory to prevent conflicts.
	# Might cause issues when using them.
	cp -rf "$TERMUX_PKG_BUILDDIR"/include/ "$TERMUX_PREFIX"/include/"$TERMUX_PKG_NAME"
}
