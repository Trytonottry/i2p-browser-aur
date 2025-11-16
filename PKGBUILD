# Maintainer: Trytonottry <trytonottry@proton.me>
pkgname=i2p-browser
pkgver=2.5.0
pkgrel=1
pkgdesc="I2P Browser Bundle for Linux (Firefox ESR with I2P routing integration)"
arch=('x86_64')
url="https://geti2p.net"
license=('GPL3')
depends=('glibc' 'bash')
makedepends=('unzip')
source=(
    "i2p-browser.tar.xz::https://download.i2p2.de/releases/i2pbrowser/${pkgver}/i2p-browser-linux64-${pkgver}.tar.xz"
    "i2p-browser.tar.xz::https://mirror.cyberbits.eu/i2p/releases/i2pbrowser/${pkgver}/i2p-browser-linux64-${pkgver}.tar.xz"
    "i2p-browser.tar.xz::https://mirror2.i2p2.no/releases/i2pbrowser/${pkgver}/i2p-browser-linux64-${pkgver}.tar.xz"
    "i2p-browser.tar.xz::https://repo.i2p2.de/releases/i2pbrowser/${pkgver}/i2p-browser-linux64-${pkgver}.tar.xz"
    "i2p-browser.tar.xz::https://deb.i2p2.de/releases/i2pbrowser/${pkgver}/i2p-browser-linux64-${pkgver}.tar.xz"
    "i2p-browser.sh"
    "i2p-browser.desktop"
)
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

package() {
    install -dm755 "$pkgdir/opt/i2p-browser"

    # Проверяем, что файл существует (makepkg мог не скачать из-за таймаута)
    if [[ ! -f "$srcdir/i2p-browser.tar.xz" ]]; then
        error "Source file i2p-browser.tar.xz not found!"
        exit 1
    fi

    # Распаковываем .tar.xz
    bsdtar -xf "$srcdir/i2p-browser.tar.xz" -C "$pkgdir/opt/i2p-browser" || {
        error "Failed to extract i2p-browser.tar.xz"
        exit 1
    }

    # Проверяем, не вложен ли .zip внутри (на всякий случай)
    local inner_zip="$pkgdir/opt/i2p-browser/i2p-browser-linux64-${pkgver}.zip"
    if [[ -f "$inner_zip" ]]; then
        unzip -qo "$inner_zip" -d "$pkgdir/opt/i2p-browser"
        rm -f "$inner_zip"
    fi

    # Устанавливаем лаунчер и .desktop
    install -Dm755 "$srcdir/i2p-browser.sh" "$pkgdir/usr/bin/i2p-browser"
    install -Dm644 "$srcdir/i2p-browser.desktop" "$pkgdir/usr/share/applications/i2p-browser.desktop"
}
