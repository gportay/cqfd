# Maintainer: Gaël PORTAY <gael.portay@gmail.com>

pkgname=cqfd
pkgver=5.7.0
pkgrel=1
pkgdesc='A tool to wrap commands in controlled Docker containers using docker.'
arch=(any)
url="https://github.com/savoirfairelinux/$pkgname"
license=(GPL-3.0-only)
depends=(bash bash-completion)
checkdepends=(shellcheck)
source=("https://github.com/savoirfairelinux/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=(SKIP)

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	depends+=(docker)

	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" PREFIX="/usr" install
	install -D -m 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
