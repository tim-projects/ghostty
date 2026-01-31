pkgname=ghostty-git
pkgver=r0.0.0
pkgrel=1
pkgdesc="Fast, native, feature-rich terminal emulator pushing modern features"
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
    'simdutf'
    'wayland'
    'gstreamer'
    'gst-plugins-base'
    'gst-plugins-good'
    'gtk4-layer-shell'
)
makedepends=(
    'git'
    'zig'
    'blueprint-compiler'
    'pandoc'
    'pkgconf'
    'llvm'
    'ncurses'
    'scdoc'
    'wayland-protocols'
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
    
    # We let Zig fetch dependencies during the build process.
    # For a completely offline build, one would use the fetch-zig-cache.sh script
    # and the --system flag as described in PACKAGING.md.
    zig build \
        --prefix /usr \
        -Doptimize=ReleaseFast \
        -Dcpu=baseline
}

package() {
    cd "ghostty"
    
    DESTDIR="$pkgdir" zig build \
        --prefix /usr \
        -Doptimize=ReleaseFast \
        -Dcpu=baseline
}