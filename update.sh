#!/usr/bin/env sh

# Commands taken from:
# https://assafmo.github.io/2019/05/02/ppa-repo-hosted-on-github.html

# Packages & Packages.gz
dpkg-scanpackages --multiversion . > simdjson/Packages
gzip -k -f simdjson/Packages

# Release, Release.gpg & InRelease
apt-ftparchive release . > simdjson/Release
gpg --default-key "$EMAIL" -abs -o - simdjson/Release > simdjson/Release.gpg
gpg --default-key "$EMAIL" --clearsign -o - simdjson/Release > simdjson/InRelease
