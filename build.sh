#!/usr/bin/env bash
set -euo pipefail

cd emacs-snapshot-*
mv ../rules debian/rules

env DEB_BUILD_OPTIONS=nocheck dpkg-buildpackage -uc -b -nc

cd .. 
mkdir archive
mv *.deb archive
