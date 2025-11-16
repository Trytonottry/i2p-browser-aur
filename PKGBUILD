# Maintainer: Trytonottry <trytonottry@proton.me>
pkgname=i2p-browser
pkgver=2.0_beta4
pkgrel=1
pkgdesc="I2P Browser Bundle for Linux (Firefox ESR with I2P routing integration)"
arch=('x86_64')
url="https://geti2p.net/en/browser"
license=('GPL3')
depends=('glibc' 'bash')
makedepends=('unzip' 'libarchive')
source=(
    "i2p-browser.tar.xz::https://download.i2p2.de/releases/i2pbrowser/${pkgver}/i2p-browser-linux64-${pkgver}_en-US.tar.xz"
    "i2p-browser.tar.xz::https://mirror.cyberbits.eu/i2p/releases/i2pbrowser/${pkgver}/i2p-browser-linux64-${pkgver}_en-US.tar.xz"
    "i2p-browser.tar.xz::https://mirror2.i2p2.no/releases/i2pbrowser/${pkgver}/i2p-browser-linux64-${pkgver}_en-US.tar.xz"
    "i2p-browser.sh"
    "i2p-browser.desktop"
)
sha256sums=(
    'da772ebe03937b09915f9016d9c09b64666025b4ae4c9353861dcf40d916ca7d'
    'da772ebe03937b09915f9016d9c09b64666025b4ae4c9353861dcf40d916ca7d'
    'da772ebe03937b09915f9016d9c09b64666025b4ae4c9353861dcf40d916ca7d'
    'SKIP'
    'SKIP'
)

package() {
    install -dm755 "$pkgdir/opt/i2p-browser"
    bsdtar -xf "$srcdir/i2p-browser.tar.xz" -C "$pkgdir/opt/i2p-browser" || exit 1
    install -Dm755 "$srcdir/i2p-browser.sh" "$pkgdir/usr/bin/i2p-browser"
    install -Dm644 "$srcdir/i2p-browser.desktop" "$pkgdir/usr/share/applications/i2p-browser.desktop"
}
