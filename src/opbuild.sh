#!/bin/bash
USERHOME=/opt/opbuild
OWN=$(ls -ld /opt/opbuild |awk '{print $3}')

cd $USERHOME

if [ $OWN != opbuild ];then
	sudo chown -R opbuild:opbuild /opt/opbuild
fi


case $1 in
	pull)
		bash -c /src/opupdate.sh
		;;
	conf)
		bash -c /src/opconfig.sh
		;;
	make)
		bash -c /src/opcompile.sh
		;;
	dl)
		bash -c /src/opdownload.sh
		;;
	*)
		echo "参数必须为 '|pull|conf|make|dl|'！"
		exit 2
		;;
esac

