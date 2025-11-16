# Maintainer: Trytonottry <trytonottry@proton.me>
pkgname=i2p-browser
pkgver=2.5.0
pkgrel=1
pkgdesc="I2P Browser: Firefox ESR + I2P Router (built from source)"
arch=('x86_64')
url="https://geti2p.net"
license=('GPL3' 'MPL2')
depends=('gtk3' 'dbus-glib' 'libxt' 'startup-notification' 'alsa-lib')
makedepends=('wget' 'unzip' 'java-runtime')
optdepends=('pulseaudio: for audio')
install=i2p-browser.install

source=(
    "https://geti2p.net/downloads/i2pinstall_${pkgver}_linux-only.jar"
    "https://download.mozilla.org/?product=firefox-esr-latest&os=linux64&lang=en-US"
    "i2p-browser.sh"
    "i2p-browser.desktop"
    "install-i2p.sh"
)
sha256sums=(
    'SKIP'  # Замени после первой сборки: updpkgsums
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
)

prepare() {
    # 1. Скачиваем Firefox ESR
    if [[ ! -f "firefox-esr.tar.bz2" ]]; then
        wget -O firefox-esr.tar.bz2 \
             "https://download.mozilla.org/?product=firefox-esr-latest&os=linux64&lang=en-US"
    fi

    # 2. Скачиваем I2P Router
    if [[ ! -f "i2pinstall_${pkgver}_linux-only.jar" ]]; then
        wget "https://geti2p.net/downloads/i2pinstall_${pkgver}_linux-only.jar"
    fi
}

package() {
    # Папка установки
    local dest="$pkgdir/opt/i2p-browser"

    # 1. Устанавливаем Firefox ESR
    install -dm755 "$dest/firefox"
    bsdtar -xf firefox-esr.tar.bz2 -C "$dest/firefox" --strip-components=1

    # 2. Устанавливаем I2P Router
    install -dm755 "$dest/i2p"
    java -jar "i2pinstall_${pkgver}_linux-only.jar" -console <<EOF
$dest/i2p
y
EOF

    # 3. Лаунчер
    install -Dm755 i2p-browser.sh "$pkgdir/usr/bin/i2p-browser"

    # 4. .desktop
    install -Dm644 i2p-browser.desktop "$pkgdir/usr/share/applications/i2p-browser.desktop"

    # 5. Иконка
    install -Dm644 "$dest/firefox/browser/chrome/icons/default/default128.png" \
                   "$pkgdir/usr/share/pixmaps/i2p-browser.png"
}