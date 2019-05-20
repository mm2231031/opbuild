#!/bin/bash
USERHOME=/opt/opbuild
OWN=$(ls -ld /opt/opbuild |awk '{print $3}')

cd $USERHOME

if [ $OWN != opbuild ];then
	chown -R opbuild:opbuild /opt/opbuild
fi


case $1 in
	pull)
		su - opbuild -c /src/opupdate.sh
		;;
	conf)
		su - opbuild -c /src/opconfig.sh
		;;
	make)
		su - opbuild -c /src/opcompile.sh
		;;
	dl)
		su - opbuild -c /src/opdownload.sh
		;;
	*)
		echo "参数必须为 '|pull|conf|make|dl|'！"
		exit 2
		;;
esac

