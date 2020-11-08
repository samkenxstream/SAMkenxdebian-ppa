#!/usr/bin/env sh

# Packages & Packages.gz
dpkg-scanpackages --multiversion . > dists/simdjson/main/binary-ppc64el/Packages
gzip -k -f dists/simdjson/main/binary-ppc64el/Packages

# Release, Release.gpg & InRelease
cd dists/simdjson

rm Release Release.gpg InRelease

apt-ftparchive release . > ../Release
cat - ../Release > Release <<EOF
Origin: simdjson
Label: simdjson
Suite: simdjson
Codename: simdjson
Architectures: ppc64el
Components: main
Description: simdjson
EOF

rm ../Release

gpg -abs -o - Release > Release.gpg
gpg --clearsign -o - Release > InRelease
