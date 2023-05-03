#!/bin/bash

cd /home/pi
sudo rm -R /home/pi/versionA110
git clone http://github.com/manel1954/versionA110

nueva_version=$(awk "NR==1" /home/pi/versionA110/versionA110.txt)

version_actual=$(awk "NR==101" /home/pi/status.ini)

if [ "$version_actual" = "$nueva_version" ];then
echo "no hace nada"
else
cd /home/pi/A110/qt
./qt_comprueba_version 
fi