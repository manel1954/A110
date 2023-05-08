#!/bin/bash

SCRIPTS_version=$(awk "NR==1" /home/pi/.config/autostart/version)
cd /home/pi/Desktop
sudo cp Abrir_dump1090.desktop /home/pi
sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version; sudo sh cerrar_dump1090.sh'" /home/pi/Abrir_dump1090.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/ICO_AVION_ON.png" /home/pi/Abrir_dump1090.desktop
sed -i "10c Name[es_ES]=Cerrar Dump1090" /home/pi/Abrir_dump1090.desktop

cd /home/pi
sudo cp Abrir_dump1090.desktop /home/pi/Desktop
sudo rm /home/pi/Abrir_dump1090.desktop  

stick=$(awk "NR==40" /home/pi/status.ini)
raw=$(awk "NR==42" /home/pi/status.ini)
ppm=$(awk "NR==44" /home/pi/status.ini)
http=$(awk "NR==46" /home/pi/status.ini)
gain=$(awk "NR==48" /home/pi/status.ini)
beast=$(awk "NR==50" /home/pi/status.ini)

if [ "$stick" = 'RSP1' ];then
xterm -geometry 88x51+22+0 -bg black -fg green -fa ‘verdana’ -fs 9x -T DUMP1090 -e /home/pi/dump1090_sdrplay/dump1090 --net --interactive --dev-sdrplay #--net-ro-port $raw --net-bo-port $beast --ppm $ppm --net-http-port $http

elif [ "$gain" = '-10' ];then
xterm -geometry 88x51+22+0 -bg black -fg green -fa ‘verdana’ -fs 9x -T DUMP1090 -e /home/pi/dump1090/dump1090 --net --interactive --net-ro-port $raw --net-bo-port $beast --gain $gain --ppm $ppm --net-http-port $http
else
xterm -geometry 88x51+22+0 -bg black -fg green -fa ‘verdana’ -fs 9x -T DUMP1090 -e /home/pi/dump1090/dump1090 --net --interactive --net-ro-port $raw --net-bo-port $beast --ppm $ppm --net-http-port $http
fi

cd /home/pi/Desktop
sudo cp Abrir_dump1090.desktop /home/pi
sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version; sh ejecutar_dump1090.sh'" /home/pi/Abrir_dump1090.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/ICO_AVION_OFF.png" /home/pi/Abrir_dump1090.desktop
sed -i "10c Name[es_ES]=Abrir Dump1090" /home/pi/Abrir_dump1090.desktop

cd /home/pi
sudo cp Abrir_dump1090.desktop /home/pi/Desktop
sleep 1
sudo rm /home/pi/Abrir_dump1090.desktop
