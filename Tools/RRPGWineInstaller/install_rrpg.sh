#!/bin/sh

# Constantes


RRPG_INSTALLER_NAME=RRPG7.8c_beta1.exe
RRPG_INSTALLER_URL=http://firecast.app/downloads/$RRPG_INSTALLER_NAME
INSTALLER_WINE_ARCH=win32
INSTALLER_WINE_PREFIX_PATH=$HOME/.wine-rrpg
INSTALLER_WINE_COMMAND=wine-development
INSTALLER_CMD_PREFIX="WINEPREFIX=$INSTALLER_WINE_PREFIX_PATH WINEARCH=$INSTALLER_WINE_ARCH WINE=$INSTALLER_WINE_COMMAND"
WINE_CMD="$INSTALLER_CMD_PREFIX $INSTALLER_WINE_COMMAND"
WINETRICKS_CMD="$INSTALLER_CMD_PREFIX winetricks"

#Instalação das fontes
sudo mkdir /usr/local/share/fonts/ms_fonts
sudo cp fontes/*.ttf /usr/local/share/fonts/ms_fonts/
sudo chmod 644 /usr/local/share/fonts/ms_fonts/* -R
sudo chmod 755 /usr/local/share/fonts/ms_fonts
sudo fc-cache -fv

#instalação do wine, winetricks e winbind (requerido)
sudo apt-get install wine-development winetricks winbind #libvulkan1 libvulkan1:i386 mesa-vulkan-drivers mesa-vulkan-drivers:i386

#criação e configuração do prefix 32bits exclusivo pro RRPG
eval $WINE_CMD wineboot
eval $WINETRICKS_CMD -q comctl32 comctl32ocx comdlg32ocx d3dx11_43 gdiplus ole32 windowscodecs wininet mfc42 allfonts
eval $WINETRICKS_CMD -q win10

#download do instalador
wget $RRPG_INSTALLER_URL -O ./$RRPG_INSTALLER_NAME

#start do instalador do RRPG
eval $WINE_CMD ./$RRPG_INSTALLER_NAME /VERYSILENT /WINE

#cópia do script de execução do RRPG
cp ./RRPG.sh ~/
