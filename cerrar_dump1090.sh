#!/bin/bash

killall dump1090

SCRIPTS_version=$(awk "NR==1" /home/pi/.config/autostart/version)
cd /home/pi/Desktop
sudo cp Abrir_dump1090.desktop /home/pi
sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version; sudo sh ejecutar_dump1090.sh'" /home/pi/Abrir_dump1090.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/ICO_AVION_OFF.png" /home/pi/Abrir_dump1090.desktop
sed -i "10c Name[es_ES]=Abrir Dump1090" /home/pi/Abrir_dump1090.desktop

cd /home/pi
sudo cp Abrir_dump1090.desktop /home/pi/Desktop
#
sudo rm /home/pi/Abrir_dump1090.desktop
#
