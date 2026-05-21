# Syncthing as a Magisk module
This was made mainly because Syncthing-fork (and adjacents apps) were unable to write (or even read) to/from the SD card 
(probably because of Google making direct storage access incredibly difficult on older Android versions)

## Installation

1.  Download the latest module `zip` file。
2.  Open the Magisk app.
3.  Go to `Modules` -> `Install from storage`.
4.  Select the `zip` file you downloaded.
5.  The installation will proceed automatically. 
6.  Reboot your device once the installation is complete.

## Known issues
* Can't fully stop the service (`service.sh` will always make it unconditionally alive no matter what)
* The device name will always be `localhost`, which is totally unrelated to anything about the current device info (not really an breaking issue, but worth looking into it later)
* Wi-fi connection sometimes dies when syncing a lot of files (that's probably only a thing on my side. Though I don't have any other rooted device to reproduce this)
* Syncthing is running on root. Spicy...

### Accessing the Syncthing Web UI

Once Syncthing is running, you can access its web management interface by opening `http://127.0.0.1:8384` in a browser on your phone.
