#!/bin/bash
SCRIPTS_version=$(awk "NR==1" /home/pi/.config/autostart/version)

cd /home/pi/Desktop
sudo cp Activar_dvswitch.desktop /home/pi
sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version; sudo sh cerrar_dvswitch.sh'" /home/pi/Activar_dvswitch.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/ICO_DVSWITCH_ON.png" /home/pi/Activar_dvswitch.desktop
sed -i "10c Name[es_ES]=Desactivar Dvswitch" /home/pi/Activar_dvswitch.desktop
cd /home/pi
sudo cp Activar_dvswitch.desktop /home/pi/Desktop
sudo rm /home/pi/Activar_dvswitch.desktop

sudo systemctl restart ysfgateway.service
sudo systemctl restart dmr2ysf.service
sudo systemctl restart analog_bridge.service
sudo systemctl restart ircddbgateway.service
sudo systemctl restart md380-emu.service
sudo systemctl restart mmdvm_bridge.service
sudo systemctl restart nxdngateway.service
sudo systemctl restart p25gateway.service


#zenity --info --ok-label= --title=DVSWITCH --window-icon=/home/pi/A110/ICONO_DVSWITCH_ON.png --width=400 --timeout=5 --text "\n\nDVSWITCH ACTIVADO"
sed -i "18c DVSWITCH=ON" /home/pi/status.ini
/home/pi/A110/./qt_dvswitch_activado
	
			