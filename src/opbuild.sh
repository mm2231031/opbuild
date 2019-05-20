#!/bin/bash

OWN=$(ls -ld /opt/opbuild |awk '{print $3}')

if [ $OWN != opbuild ];then
	chown -R opbuild:opbuild /opt/opbuild
fi


case $1 in
	update)
		bash -c /src/opupdate.sh
		;;
	config)
		bash -c /src/opconfig.sh
		;;
	make)
		bash -c /src/opcompile.sh
		;;
	download)
		bash -c /src/opdownload.sh
		;;
	*)
		echo "参数必须为 '|update|config|make|download|'！"
		exit 2
		;;
esac

