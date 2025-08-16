# Maintainer: Gaël PORTAY <gael.portay@gmail.com>

pkgname=cqfd6
pkgver=6
pkgrel=1
pkgdesc='Wrap commands in controlled Docker containers using docker.'
arch=(any)
url="https://github.com/gportay/$pkgname"
license=(GPL-3.0-only)
depends=(bash)
makedepends=(asciidoctor bash-completion)
checkdepends=(shellcheck)
source=("$pkgname-$pkgver.tar.gz::https://github.com/gportay/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=(SKIP)
provides=(cqfd)
conflicts=(cqfd)

build() {
	cd "$pkgname-$pkgver"
	make doc
}

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
