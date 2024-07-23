#!/bin/sh
rm Packages Packages.gz Release Release.gpg InRelease
dpkg-scanpackages -m . > Packages
gzip -k -f Packages
apt-ftparchive release . > Release
gpg --pinentry-mode loopback --default-key B99EE3584A5312F6  -abs -o Release.gpg Release
gpg --pinentry-mode loopback --default-key B99EE3584A5312F6 --clearsign -o InRelease Release
