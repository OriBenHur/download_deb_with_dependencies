#!/bin/bash
read -r -p "Input Package Name: " pack
currentDir=$(pwd)
mkdir /tmp/$pack
cd /tmp/$pack
apt-get download $pack && apt-cache depends -i $pack | awk '/Depends:/ {print $2}' | xargs apt-get download
tar -czvf $pack.tar.gz *.deb
cp $pack.tar.gz $currentDir/
rm -rf /tmp/$pack
