#Installs a set of Linux AppImages by simply downloading them and making them executable

APPIMG_DIR=$HOME/.local/bin

mkdir -p $APPIMG_DIR

echo -e '\t* AppImages to install: YubiOAUTH'

#Yubikey OAUTH client
wget -4 -q -O $APPIMG_DIR/yubioauth https://developers.yubico.com/yubioath-desktop/Releases/yubioath-desktop-latest-linux.AppImage
mkdir -p $HOME/.local/share/applications
cp desktop-entries/* $HOME/.local/share/applications/

chmod u+x $APPIMG_DIR/*

echo ''
