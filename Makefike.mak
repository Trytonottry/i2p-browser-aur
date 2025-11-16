PKGNAME = i2p-browser

# Remote names — подстрой если нужно
GITHUB_REMOTE = github
AUR_REMOTE = origin

all: check

fmt:
	@echo "==> Formatting PKGBUILD"
	@pkgfmt -w PKGBUILD

srcinfo:
	@echo "==> Generating .SRCINFO"
	@makepkg --printsrcinfo > .SRCINFO

lint:
	@echo "==> Linting PKGBUILD"
	@namcap PKGBUILD || true
	@namcap *.pkg.tar.* || true

check: fmt srcinfo lint
	@echo "==> All checks passed"

push-github: check
	@echo "==> Pushing to GitHub..."
	git add .
	git commit -m "Update package" || true
	git push $(GITHUB_REMOTE) main

push-aur:
	@echo "==> Preparing AUR push..."
	git add PKGBUILD .SRCINFO
	git commit -m "AUR update" || true
	@echo "==> Pushing to AUR (master only)..."
	git push $(AUR_REMOTE) master
