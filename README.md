# Syncthing as a Magisk module
This was made mainly because Syncthing-fork (and adjacents apps) were unable to write (or even read) to/from the SD card due to Google making direct storage access incredibly difficult on older Android versions.

If the apps are working for your use-case, that's great, you can keep using them. There's nearly no benefit on using this module if you don't have a *niche use-case* for using Syncthing.

## Installation

1.  Download the latest module `zip` file.
2.  Open the Magisk app.
3.  Go to `Modules` -> `Install from storage`.
4.  Select the `zip` file you downloaded.
5.  The installation will proceed automatically. 
6.  Reboot your device once the installation is complete.

## Known issues
* Can't fully stop the service (`service.sh` will always make it unconditionally alive no matter what)
* The device name will set as `localhost` in the first run, which is totally unrelated to anything about the current device info (not really an breaking issue since you can change that yourself through the GUI, but worth looking into it later)
* Wi-fi connection sometimes dies when syncing a lot of files (that's probably only a thing on my side. Though I don't have any other rooted device to reproduce this)
* Syncthing is running on root. Spicy...

### Accessing the Syncthing Web UI

Once Syncthing is running, you can access its web management interface by opening `http://127.0.0.1:8384` in a browser on your phone.
