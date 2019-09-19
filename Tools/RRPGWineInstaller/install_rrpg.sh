#!/bin/sh

# Variáveis de Ambiente
export WINEARCH=win32
export WINEPREFIX=$HOME/.wine-rrpg

# Constantes
SILENT=true

RRPG_INSTALLER_NAME=RRPG7.8c_beta6.exe
RRPG_INSTALLER_URL=http://firecast.app/downloads/$RRPG_INSTALLER_NAME
RRPG_INSTALL_DIRECTORY=$WINEPREFIX/drive_c/RRPG

LOG_ERROR_PREFIX="\e[31m"  ## red color
LOG_WARNING_PREFIX="\e[33m"  ## yellow color
LOG_PROGRESS_COLOR_PREFIX="\e[32m"  ## green color
LOG_RESET="\e[0m"

## Funções

prepare_installer_environment_for_silence()
{
   if [ "$SILENT" = true ]; then
     export WINEDEBUG="warn-all,fixme-all,trace-all,err-all"
     SILENT_Q_FLAG="-q"
   else
     export WINEDEBUG=
     SILENT_Q_FLAG=
   fi
}

log_progress()
{
  echo "$LOG_PROGRESS_COLOR_PREFIX > $1 $LOG_RESET"
  return 0
}

log_warning()
{
  echo "$LOG_WARNING_PREFIX > Warning: $1 $LOG_PROGRESS_COLOR_RESET"
  return 0
}

log_error()
{
  echo "$LOG_ERROR_PREFIX > Error: $1 $LOG_PROGRESS_COLOR_RESET"
  return 0
}

apt_get_part_number_of_version_with_grep()
{
    TEMP=$(apt-cache show $1 --no-all-versions | grep -oiP "$3")

    if [ -z "$TEMP" ]; then
      TEMP=0
    fi

    eval "$2=$TEMP"
}

apt_get_version()
{
    apt_get_part_number_of_version_with_grep $1	TEMP_MAJOR "Version:\s*\K([0-9]*)(?=)"
    apt_get_part_number_of_version_with_grep $1	TEMP_MINOR "Version:\s*([0-9]*)\.\K([0-9]*)(?=)"

    eval "$2=$TEMP_MAJOR"
    eval "$3=$TEMP_MINOR"
}

select_wine_package_if_newer_version()
{
    apt_get_version $1 THIS_PACKAGE_MAJOR_VERSION THIS_PACKAGE_MINOR_VERSION

    if [ -z "$THIS_PACKAGE_MAJOR_VERSION" -a -z "$THIS_PACKAGE_MINOR_VERSION" ]; then
      # not avaliable package
      return
    fi

    is_this_wine_package_newer=false

    if [ $THIS_PACKAGE_MAJOR_VERSION -gt $WINE_PACKAGE_MAJOR_VERSION ]; then
       is_this_wine_package_newer=true
    else
        if [ $THIS_PACKAGE_MAJOR_VERSION -eq $WINE_PACKAGE_MAJOR_VERSION -a \
             $THIS_PACKAGE_MINOR_VERSION -gt $WINE_PACKAGE_MINOR_VERSION ]; then
            is_this_wine_package_newer=true
        fi
    fi

    if [ "$is_this_wine_package_newer" = true ]; then

       silent_eval "apt-get install $1 --simulate"

        if [ $? -ne 0 ]; then
            log_warning "Wine package $1 $THIS_PACKAGE_MAJOR_VERSION.$THIS_PACKAGE_MINOR_VERSION is avaliable but can not be installed"
	else
            WINE_PACKAGE="$1"
            WINE_COMMAND="$2"
     	    WINE_PACKAGE_MAJOR_VERSION="$THIS_PACKAGE_MAJOR_VERSION"
	    WINE_PACKAGE_MINOR_VERSION="$THIS_PACKAGE_MINOR_VERSION"
        fi
    fi
}

choose_newer_avaliable_wine_package_to_use()
{
    log_progress "Updating apt packages..."	
    silent_eval "sudo apt-get update"

    WINE_PACKAGE=""
    WINE_COMMAND=""
    WINE_PACKAGE_MAJOR_VERSION=0
    WINE_PACKAGE_MINOR_VERSION=0  
    
    log_progress "Selecting Wine package to use..."    

    select_wine_package_if_newer_version "wine-development" "wine-development"
    select_wine_package_if_newer_version "wine" "wine"
    select_wine_package_if_newer_version "winehq-stable" "wine"
    select_wine_package_if_newer_version "winehq-devel" "wine"

    echo ""
    log_progress "Choosen Wine Package: $WINE_PACKAGE, Command: $WINE_COMMAND, Version: $WINE_PACKAGE_MAJOR_VERSION.$WINE_PACKAGE_MINOR_VERSION"
    echo ""
}

prepare_installer_environment()
{
   export WINE="$WINE_COMMAND"

   if [ $WINE_PACKAGE_MAJOR_VERSION -ge 4 ]; then
       # suppress wine 4.0+ requesting wine-mono and wine-gecko dialog	
       WINE_FIRST_PREFIX_BOOT_ARGS="WINEDLLOVERRIDES=\"mscoree,mshtml=\""
   fi
}

silent_eval()
{
   if [ "$SILENT" = true ]; then
     DUMMY=$(eval $1)
   else
     eval $1
   fi
 
  return $?
}

silent_eval_with_error_care()
{
   if [ "$SILENT" = true ]; then
     DUMMY=$(eval $1)

     if [ $? -ne 0 ]; then
     	log_error "Error with $1:\n$DUMMY"
     fi
   else
     eval $1
   fi
 
  return $?
}

# Script preparatório

prepare_installer_environment_for_silence

if [ $# -eq 1 -a "$1" = "--wd" ]; then
    WINE_PACKAGE=wine-development
    WINE_COMMAND=wine-development
else
    choose_newer_avaliable_wine_package_to_use
fi

prepare_installer_environment


#instalação do wine, winbind (requerido) e imagemagick
set e-

log_progress "Installing apt packages..."

silent_eval_with_error_care "sudo apt-get install -y --install-recommends $WINE_PACKAGE winbind imagemagick"

#criação do prefix 32bits exclusivo pro RRPG
log_progress "Preparing wine prefix..."

rm -rf $WINEPREFIX
silent_eval_with_error_care "$WINE_FIRST_PREFIX_BOOT_ARGS $WINE wineboot"

#download do winetricks mais recente
silent_eval "wget https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks"
silent_eval "chmod +x ./winetricks"

#configuração do prefix
log_progress "Installing winetricks components..."

silent_eval_with_error_care "./winetricks -q gdiplus ole32 windowscodecs wininet mfc42 riched30 d3dx11_43"
silent_eval_with_error_care "./winetricks -q win10"

#download do instalador
if [ ! -f ./$RRPG_INSTALLER_NAME ]; then
    log_progress "Downloading RRPG installer..." 
    silent_eval_with_error_care "wget $SILENT_Q_FLAG $RRPG_INSTALLER_URL -O ./$RRPG_INSTALLER_NAME"
fi

#start do instalador do RRPG
log_progress "Installing RRPG..."
silent_eval_with_error_care "$WINE ./$RRPG_INSTALLER_NAME /VERYSILENT /WINE"

set e+

#Instalação das fontes
log_progress "Installing Fonts..."

silent_eval "sudo mkdir -p /usr/local/share/fonts/ms_fonts"
silent_eval "sudo cp $RRPG_INSTALL_DIRECTORY/wine/fonts/*.ttf /usr/local/share/fonts/ms_fonts/"
silent_eval "sudo chmod 644 /usr/local/share/fonts/ms_fonts/* -R"
silent_eval "sudo chmod 755 /usr/local/share/fonts/ms_fonts"
silent_eval "sudo fc-cache -fv"

#criação do script de execução do RRPG
log_progress "Installing RRPG shortcuts..."

cat <<EOF >$RRPG_INSTALL_DIRECTORY/wine/rrpg.sh
#!/bin/sh
export WINEARCH=$WINEARCH
export WINEPREFIX=$WINEPREFIX
$WINE $RRPG_INSTALL_DIRECTORY/rrpg.exe \$1
EOF

silent_eval_with_error_care "chmod +x $RRPG_INSTALL_DIRECTORY/wine/rrpg.sh"
silent_eval_with_error_care "ln -sfn $RRPG_INSTALL_DIRECTORY/wine/rrpg.sh $HOME/rrpg.sh"

#adição dos atalhos aos menus
silent_eval "mkdir -p ~/.local/share/icons/hicolor/256x256/apps/ && cp $RRPG_INSTALL_DIRECTORY/wine/images/rrpg_logo_256.png ~/.local/share/icons/hicolor/256x256/apps/rrpg.png"
silent_eval "mkdir -p ~/.local/share/icons/hicolor/128x128/apps/ && convert $RRPG_INSTALL_DIRECTORY/wine/images/rrpg_logo_256.png -resize 128x128 ~/.local/share/icons/hicolor/128x128/apps/rrpg.png"
silent_eval "mkdir -p ~/.local/share/icons/hicolor/64x64/apps/ && convert $RRPG_INSTALL_DIRECTORY/wine/images/rrpg_logo_256.png -resize 64x64 ~/.local/share/icons/hicolor/64x64/apps/rrpg.png"
silent_eval "mkdir -p ~/.local/share/icons/hicolor/48x48/apps/ && convert $RRPG_INSTALL_DIRECTORY/wine/images/rrpg_logo_256.png -resize 48x48 ~/.local/share/icons/hicolor/48x48/apps/rrpg.png"
silent_eval "mkdir -p ~/.local/share/icons/hicolor/32x32/apps/ && convert $RRPG_INSTALL_DIRECTORY/wine/images/rrpg_logo_256.png -resize 32x32 ~/.local/share/icons/hicolor/32x32/apps/rrpg.png"
silent_eval "mkdir -p ~/.local/share/icons/hicolor/24x24/apps/ && convert $RRPG_INSTALL_DIRECTORY/wine/images/rrpg_logo_256.png -resize 24x24 ~/.local/share/icons/hicolor/24x24/apps/rrpg.png"
silent_eval "mkdir -p ~/.local/share/icons/hicolor/16x16/apps/ && convert $RRPG_INSTALL_DIRECTORY/wine/images/rrpg_logo_256.png -resize 16x16 ~/.local/share/icons/hicolor/16x16/apps/rrpg.png"

cat <<EOF >$RRPG_INSTALL_DIRECTORY/wine/rrpg.desktop
[Desktop Entry]
Type=Application
GenericName=RRPG
Exec=$RRPG_INSTALL_DIRECTORY/wine/rrpg.sh %f
MimeType=application/x-rrpg-plugin-package
Icon=rrpg
Name=RRPG Firecast
Name[en_US]=RRPG Firecast
Categories=Game
EOF

silent_eval "desktop-file-install --dir=$HOME/.local/share/applications $RRPG_INSTALL_DIRECTORY/wine/rrpg.desktop"

cat <<EOF >$RRPG_INSTALL_DIRECTORY/wine/rrpg-firecast.xml
<?xml version="1.0"?>
<mime-info xmlns='http://www.freedesktop.org/standards/shared-mime-info'>
  <mime-type type="application/x-rrpg-plugin-package">  
    <comment>Plugin do RRPG Firecast</comment>
    <glob pattern="*.rpk"/>
  </mime-type>
</mime-info>
EOF

silent_eval "xdg-icon-resource install --context mimetypes --size 128 $RRPG_INSTALL_DIRECTORY/wine/images/rrpg-firecast-plugin.png application-x-rrpg-plugin-package"
silent_eval "xdg-mime install $RRPG_INSTALL_DIRECTORY/wine/rrpg-firecast.xml"
silent_eval "xdg-mime default rrpg.desktop application/x-rrpg-plugin-package"

rm ./$RRPG_INSTALLER_NAME
rm ./winetricks

echo ""
echo ""
log_progress "=) RRPG Instalado com sucesso! Procure por RRPG Firecast no menu \"Jogos\" ou \"Games\" do seu ambiente gráfico!"
log_progress "Também é possível executá-lo no terminal com o comando ~/rrpg.sh"
echo ""
