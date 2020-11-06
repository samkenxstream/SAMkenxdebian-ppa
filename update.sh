#!/usr/bin/env sh

# Commands taken from:
# https://assafmo.github.io/2019/05/02/ppa-repo-hosted-on-github.html

# Packages & Packages.gz
dpkg-scanpackages --multiversion . > Packages
gzip -k -f Packages

# Release, Release.gpg & InRelease
apt-ftparchive release . > Release
gpg --default-key "$EMAIL" -abs -o - Release > Release.gpg
gpg --default-key "$EMAIL" --clearsign -o - Release > InRelease
