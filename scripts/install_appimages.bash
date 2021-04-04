#Installs a set of Linux AppImages by simply downloading them and making them executable

APPIMG_DIR=$HOME/.local/bin

mkdir -p $APPIMG_DIR

echo -e '\t* AppImages to install: YubiOAUTH'

#Yubikey OAUTH client
wget -q -O $APPIMG_DIR/yubioauth https://developers.yubico.com/yubioath-desktop/Releases/yubioath-desktop-latest-linux.AppImage

chmod u+x $APPIMG_DIR/*

echo ''
