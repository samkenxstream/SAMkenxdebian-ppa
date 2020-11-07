#!/usr/bin/env sh

# Commands taken from:
# https://assafmo.github.io/2019/05/02/ppa-repo-hosted-on-github.html

# Packages & Packages.gz
dpkg-scanpackages --multiversion . > dists/simdjson/main/binary-ppc64el/Packages
gzip -k -f dists/simdjson/main/binary-ppc64el/Packages

# Release, Release.gpg & InRelease
cat - > dists/simdjson/Release <<EOF
Suite: simdjson
Codename: simdjson
Components: main
Architectures: ppc64el
EOF
apt-ftparchive release . >> dists/simdjson/Release
gpg --default-key "$EMAIL" -abs -o - dists/simdjson/Release > dists/simdjson/Release.gpg
gpg --default-key "$EMAIL" --clearsign -o - dists/simdjson/Release > dists/simdjson/InRelease
