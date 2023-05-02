#!/bin/bash

cd /home/pi/Desktop
cp ABRIR_DMR2M17.desktop /home/pi
sed -i "6c Exec=sh -c 'cd /home/pi/A110; sudo sh cerrar_DMR2M17.sh'" /home/pi/ABRIR_DMR2M17.desktop
sed -i "7c Icon=/home/pi/A110/ICO_DMR2M17_ON.png" /home/pi/ABRIR_DMR2M17.desktop
sed -i "4c Name[es_ES]=Cerrar DMR2M17" /home/pi/ABRIR_DMR2M17.desktop
sed -i "21c DMR2M17=ON" /home/pi/status.ini
cd /home/pi
cp ABRIR_DMR2M17.desktop /home/pi/Desktop

sudo rm /home/pi/ABRIR_DMR2M17.desktop

cd /home/pi/DMR2M17
xterm -geometry 88x4+648+0 -bg violet -fg black -fa ‘verdana’ -fs 9x -T CONSOLA_DMR2M17 -e ./DMR2M17 DMR2M17.ini &


cd /home/pi/MMDVMHost
xterm -geometry 88x17+648+665 -bg violet -fg black -fa ‘verdana’ -fs 9x -T CONSOLA_MMDVMDMR2M17 -e ./MMDVMDMR2M17 MMDVMDMR2M17.ini 


  