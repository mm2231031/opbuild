#!/bin/bash
mkdir /opt/opbuild
useradd -d /opt/opbuild -s /bin/bash opbuild
chown -R opbuild:opbuild /opt/opbuild
apt-get update

sudo apt-get install --yes wget curl xz-utils libelf-dev  build-essential asciidoc binutils bzip2 gawk gettext git libncurses5-dev libz-dev patch unzip zlib1g-dev lib32gcc1 libc6-dev-i386 subversion flex uglifyjs git-core gcc-multilib p7zip p7zip-full msmtp libssl-dev texinfo libglib2.0-dev xmlto qemu-utils upx  autoconf automake libtool autopoint

chmod +x /src/*.sh
