#!/bin/bash  
#Colores
ROJO="\033[1;31m"
VERDE="\033[1;32m"
BLANCO="\033[1;37m"
AMARILLO="\033[1;33m"
CIAN="\033[1;36m"
GRIS="\033[0m"
MARRON="\33[38;5;138m"


  

sudo rm /home/pi/comprueba_internet.txt
cd /home/pi
wget www.associacioader.com/comprueba_internet.txt

internet=$(awk "NR==1" /home/pi/comprueba_internet.txt)
noactualizaciones=$(awk "NR==2" /home/pi/comprueba_internet.txt)

if [ $noactualizaciones = "NOACTUALIZACIONES" ]
then
clear
echo "${AMARILLO}"
echo""
echo "***************************************************************************************"
echo "                             NO HAY NINGUNA ACTUALIZACIÓN                              "
echo "***************************************************************************************"
echo "${VERDE}PULSA ENTER PARA SALIR"
read a                                              

elif [ $internet != "SI" ]
then
clea
echo "${ROJO}"
echo "***************************************************************************************"
echo "                    NO TIENES INTERNET Y NO  SE VA A ACTUALIZAR                        "
echo "***************************************************************************************"
echo "${VERDE}PULSA ENTER PARA SALIR"
read a
sh /home/pi/A110/ejecutar_ImagenActualizada.sh &
else
{
                        clear
                        echo "${AMARILLO}"                        
                        cd /home/pi/A110                       
                        git pull
                        sh /home/pi/A110/ejecutar_ImagenActualizada.sh &
                        sleep 3
                        mv qt_* /home/pi/A110/qt
                        chmod 777 -R /home/pi/A110/qt

}


fi
exit;




