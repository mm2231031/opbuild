#!/bin/bash

OWN=$(ls -ld /opt/opbuild |awk '{print $3}')

if [ $OWN != opbuild ];then
	chown -R opbuild:opbuild /opt/opbuild
fi


case $1 in
	update)
		su - opbuild -c /src/opupdate.sh
		;;
	config)
		su - opbuild -c /src/opconfig.sh
		;;
	make)
		su - opbuild -c /src/opcompile.sh
		;;
	download)
		su - opbuild -c /src/opdownload.sh
		;;
	*)
		echo "参数必须为 '|update|config|make|download|'！"
		exit 2
		;;
esac

