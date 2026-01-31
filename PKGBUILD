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
    'wayland'
    'gstreamer'
    'gst-plugins-base'
    'gst-plugins-good'
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

# Using #depth=1 for a smaller download.
# Note: This may affect the accuracy of pkgver()'s commit count, 
# but satisfies the requirement for a smaller download.
source=("ghostty::git+ssh://git@github.com/tim-projects/ghostty.git#depth=1")
sha256sums=('SKIP')

pkgver() {
    cd "ghostty"
    # Since we use depth=1, we can't count all commits.
    # We use the short hash and the date instead for a valid, 
    # albeit non-sequential, version number.
    printf "r%s.%s" "$(git log -1 --format=%ct)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "ghostty"
    
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