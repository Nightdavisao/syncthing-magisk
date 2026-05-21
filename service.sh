#!/system/bin/sh
MODDIR=${0%/*}

PORT="8384"

SYNCTHING_BIN="$MODDIR/system/bin/syncthing"
SYNCTHING_BASEDIR="/sdcard/syncthing"
SYNCTHING_HOME="$SYNCTHING_BASEDIR/home"
LOG_FILE="$SYNCTHING_BASEDIR/syncthing.log"
SERVICE_LOG_FILE="$SYNCTHING_BASEDIR/service.log"

while true; do
    if ! pgrep -x "syncthing" > /dev/null 2>&1; then
        env HOME="/sdcard" STDNSRESOLVER=8.8.8.8:53 "$SYNCTHING_BIN" \
            --no-browser --gui-address="http://127.0.0.1:$PORT" \
            --home="$SYNCTHING_HOME" \
            --log-file="$LOG_FILE" \
            >> "$SERVICE_LOG_FILE" 2>&1
    fi
    sleep 15
done
