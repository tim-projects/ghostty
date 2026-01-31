pkgname=ghostty-git
pkgver=r0.0.0
pkgrel=1
pkgdesc="Fast, native, feature-rich terminal emulator pushing modern features (built without manpages)"
arch=('x86_64')
url="https://github.com/tim-projects/ghostty"
license=('MIT')
depends=(
    'gtk4'
    'libadwaita'
    'glib2'
    'libx11'
    'libxcursor'
    'libxext'
    'libxi'
    'libxinerama'
    'libxrandr'
    'libxkbcommon'
    'oniguruma'
    'bzip2'
    'expat'
    'fontconfig'
    'freetype2'
    'harfbuzz'
    'libpng'
    'libxml2'
    'zlib'
    'wayland'
    'gstreamer'
    'gst-plugins-base'
    'gst-plugins-good'
)
makedepends=(
    'git'
    'zig'
    'blueprint-compiler'
    'pkgconf'
    'llvm' 
    'ncurses'
    'gobject-introspection'
    'gettext'
)
provides=('ghostty')
conflicts=('ghostty')

source=("ghostty::git+ssh://git@github.com/tim-projects/ghostty.git")
sha256sums=('SKIP')

pkgver() {
    cd "ghostty"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "ghostty"
    
    # We build without a global prefix to avoid AccessDenied errors.
    # Artifacts will be placed in zig-out/ by default.
    zig build \
        -Doptimize=ReleaseFast \
        -Dcpu=baseline \
        -Demit-docs=false
}

package() {
    cd "ghostty"
    
    # Now we install to the package directory.
    DESTDIR="$pkgdir" zig build \
        --prefix /usr \
        -Doptimize=ReleaseFast \
        -Dcpu=baseline \
        -Demit-docs=false
}
