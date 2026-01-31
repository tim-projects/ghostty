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
    
    # -Demit-docs=false avoids the pandoc (Haskell) dependency
    zig build \
        --prefix /usr \
        -Doptimize=ReleaseFast \
        -Dcpu=baseline \
        -Demit-docs=false
}

package() {
    cd "ghostty"
    
    DESTDIR="$pkgdir" zig build \
        --prefix /usr \
        -Doptimize=ReleaseFast \
        -Dcpu=baseline \
        -Demit-docs=false
}