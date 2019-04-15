#!/bin/sh

# Variáveis de Ambiente
export WINEARCH=win32
export WINEPREFIX=$HOME/.wine-rrpg

# Constantes
RRPG_INSTALLER_NAME=RRPG7.8c_beta3.exe
RRPG_INSTALLER_URL=http://firecast.app/downloads/$RRPG_INSTALLER_NAME
RRPG_INSTALL_DIRECTORY=$WINEPREFIX/drive_c/RRPG

## Funções

apt_get_version()
{
    TEMP=$(apt-cache show $1 | grep -oiP "Version:\s*\K([0-9]*)(?=)")
    eval "$2=$TEMP"

    TEMP=$(apt-cache show $1 | grep -oiP "Version:\s*([0-9]*)\.\K([0-9]*)(?=)")
    eval "$3=$TEMP"
}

choose_wine_stable_or_dev()
{
    apt_get_version wine STABLE_MAJOR_VERSION STABLE_MINOR_VERSION
    apt_get_version wine-development DEV_MAJOR_VERSION DEV_MINOR_VERSION

    if [ $STABLE_MAJOR_VERSION -gt $DEV_MAJOR_VERSION ]; then
        WINE=wine
        return
    fi

    if [ $STABLE_MAJOR_VERSION -lt $DEV_MAJOR_VERSION ]; then
      WINE=wine-development
      return
    fi

    if [ $STABLE_MINOR_VERSION -gt $DEV_MINOR_VERSION ]; then
        WINE=wine
    else
        WINE=wine-development
    fi
}

# Script para definir parâmetros

if [ $# -eq 1 -a "$1" = "--wd" ]; then
    export WINE=wine-development
else
    sudo apt-get update
    choose_wine_stable_or_dev
fi

#instalação do wine, winetricks e winbind (requerido)
sudo apt-get install -y $WINE winetricks winbind imagemagick #libvulkan1 libvulkan1:i386 mesa-vulkan-drivers mesa-vulkan-drivers:i386

#criação e configuração do prefix 32bits exclusivo pro RRPG
rm -rf $WINEPREFIX
eval $WINE wineboot
eval winetricks -q gdiplus ole32 windowscodecs wininet mfc42 riched30 d3dx11_43 #comctl32 comctl32ocx comdlg32ocx allfonts
eval winetricks -q win10

#download do instalador
if [ ! -f ./$RRPG_INSTALLER_NAME ]; then
    wget $RRPG_INSTALLER_URL -O ./$RRPG_INSTALLER_NAME
fi

#start do instalador do RRPG
eval $WINE ./$RRPG_INSTALLER_NAME /VERYSILENT /WINE

#Instalação das fontes
sudo mkdir /usr/local/share/fonts/ms_fonts
sudo cp $RRPG_INSTALL_DIRECTORY/wine/fonts/*.ttf /usr/local/share/fonts/ms_fonts/
sudo chmod 644 /usr/local/share/fonts/ms_fonts/* -R
sudo chmod 755 /usr/local/share/fonts/ms_fonts
sudo fc-cache -fv

#criação do script de execução do RRPG
cat <<EOF >$RRPG_INSTALL_DIRECTORY/wine/rrpg.sh
#!/bin/sh
export WINEARCH=$WINEARCH
export WINEPREFIX=$WINEPREFIX
$WINE $RRPG_INSTALL_DIRECTORY/rrpg.exe
EOF

chmod +x $RRPG_INSTALL_DIRECTORY/wine/rrpg.sh
ln -sfn $RRPG_INSTALL_DIRECTORY/wine/rrpg.sh $HOME/rrpg.sh

#adição dos atalhos aos menus
mkdir -p ~/.local/share/icons/hicolor/256x256/apps/ && cp $RRPG_INSTALL_DIRECTORY/wine/images/rrpg_logo_256.png ~/.local/share/icons/hicolor/256x256/apps/rrpg.png
mkdir -p ~/.local/share/icons/hicolor/128x128/apps/ && convert $RRPG_INSTALL_DIRECTORY/wine/images/rrpg_logo_256.png -resize 128x128 ~/.local/share/icons/hicolor/128x128/apps/rrpg.png
mkdir -p ~/.local/share/icons/hicolor/64x64/apps/ && convert $RRPG_INSTALL_DIRECTORY/wine/images/rrpg_logo_256.png -resize 64x64 ~/.local/share/icons/hicolor/64x64/apps/rrpg.png
mkdir -p ~/.local/share/icons/hicolor/48x48/apps/ && convert $RRPG_INSTALL_DIRECTORY/wine/images/rrpg_logo_256.png -resize 48x48 ~/.local/share/icons/hicolor/48x48/apps/rrpg.png
mkdir -p ~/.local/share/icons/hicolor/32x32/apps/ && convert $RRPG_INSTALL_DIRECTORY/wine/images/rrpg_logo_256.png -resize 32x32 ~/.local/share/icons/hicolor/32x32/apps/rrpg.png
mkdir -p ~/.local/share/icons/hicolor/24x24/apps/ && convert $RRPG_INSTALL_DIRECTORY/wine/images/rrpg_logo_256.png -resize 24x24 ~/.local/share/icons/hicolor/24x24/apps/rrpg.png
mkdir -p ~/.local/share/icons/hicolor/16x16/apps/ && convert $RRPG_INSTALL_DIRECTORY/wine/images/rrpg_logo_256.png -resize 16x16 ~/.local/share/icons/hicolor/16x16/apps/rrpg.png

cat <<EOF >$RRPG_INSTALL_DIRECTORY/wine/rrpg.desktop
[Desktop Entry]
Type=Application
GenericName=RRPG
Exec=$RRPG_INSTALL_DIRECTORY/wine/rrpg.sh
Icon=rrpg
Name=RRPG Firecast
Name[en_US]=RRPG Firecast
Categories=Game
EOF

desktop-file-install --dir=$HOME/.local/share/applications $RRPG_INSTALL_DIRECTORY/wine/rrpg.desktop

rm ./$RRPG_INSTALLER_NAME

echo ""
echo ""
echo "RRPG Instalado com sucesso! Procure por RRPG Firecast no menu \"Jogos\" ou \"Games\" do seu ambiente gráfico!"
echo ""
