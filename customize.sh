#!/system/bin/sh
MODDIR=${0%/*}
ui_print "Installing the Syncthing Magisk module..."

if [ "$ARCH" == "arm" ]; then
    BINARY_PATH=$TMPDIR/binary/syncthing-arm
elif [ "$ARCH" == "arm64" ]; then
    BINARY_PATH=$TMPDIR/binary/syncthing-arm64
elif [ "$ARCH" == "x86" ]; then
    BINARY_PATH=$TMPDIR/binary/syncthing-i386
elif [ "$ARCH" == "x64" ]; then
    BINARY_PATH=$TMPDIR/binary/syncthing-amd64
fi

unzip -o "$ZIPFILE" 'binary/*' -d $TMPDIR

ui_print "* Creating binary path"
mkdir -pv $MODPATH/system/bin

ui_print "* Creating Syncthing home path"
mkdir -p /data/media/0/syncthing/home

if [ -f "$BINARY_PATH" ]; then
    ui_print "* Copying binary for $ARCH"
    cp -afv $BINARY_PATH $MODPATH/system/bin/syncthing
else
    abort "Binary file for $ARCH is missing!"
fi

set_perm_recursive $MODPATH 0 0 0755 0755
set_perm $MODPATH/system/bin/syncthing 0 0 0755
