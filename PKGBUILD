pkgname=i2p-browser
pkgver=2.5.0
pkgrel=1
pkgdesc="I2P Browser Bundle for Linux (Firefox ESR with I2P routing integration)"
arch=('x86_64')
url="https://geti2p.net"
license=('GPL3')
depends=('glibc' 'bash')
makedepends=('unzip')
install=
source=("https://download.i2p2.de/i2pbrowser/linux/i2p-browser-linux64-${pkgver}.zip"
        "i2p-browser.sh"
        "i2p-browser.desktop")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

package() {
    install -d "$pkgdir/opt/i2p-browser"
    bsdtar -xf "$srcdir/i2p-browser-linux64-${pkgver}.zip" -C "$pkgdir/opt/i2p-browser"

    install -Dm755 "$srcdir/i2p-browser.sh" "$pkgdir/usr/bin/i2p-browser"
    install -Dm644 "$srcdir/i2p-browser.desktop" "$pkgdir/usr/share/applications/i2p-browser.desktop"
}
