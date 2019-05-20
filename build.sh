#!/bin/bash
mkdir /opt/opbuild
useradd -d /opt/opbuild -s /bin/bash opbuild
chown -R opbuild:opbuild /opt/opbuild
apt-get update
apt-get install --yes wget curl vim xz-utils libelf-dev build-essential asciidoc binutils bzip2 gawk gettext git libncurses5-dev libz-dev patch unzip zlib1g-dev lib32gcc1 libc6-dev-i386 subversion flex uglifyjs git-core gcc-multilib p7zip p7zip-full msmtp libssl-dev texinfo libglib2.0-dev xmlto qemu-utils upx libelf-dev autoconf automake libtool autopoint
apt-get clean
chmod +x /src/*.sh
