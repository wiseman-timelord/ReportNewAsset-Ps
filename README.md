# SlCacheInfo-Ps

### STATUS: WORKING
SlCacheInfo works correctly. Fixed the setting of cache location, obviously there was no way to tell that one until I moved my cache.

## DESCRIPTION
SlCacheInfo is a tool to monitor for, new and updated, files in the cache of "Second Life" viewers, through specifically, developed for and tested on, "FireStorm", however, it may work with other viewers, that utilize the same cache format, mainly the, file extensions and folder structure, in the cache. This is good for, "data visualization" and "cache analysis", though due to checking multiple things to do with file systems upon a repeating 15 second basis. SlCacheInfo is perfect for determining how large your, SL cache/sound allocations and ramdisk, should be, its also somewhat effective as a data visualization tool. 

### FEATURES
- **Customizable Cache Locations**: Set custom paths for different Second Life cache data types.
- **Dynamic File Monitoring**: Real-time directory monitoring for new file creations using FileSystemWatcher.
- **Automated File Tracking**: Updates and tracks the latest files in categories like Textures, Objects, Sounds, and Others.
- **Real-time Asset Reporting**: Displays updated information of the latest files, including names and sizes.
- **Break From Loop**: requires .NET => v2.0, but features a break from loop ability on monitoring page.

### PREVIEW
Main Menu..
```
        ____  _  ____           _          ___        __
       / ___|| |/ ___|____  ___| |__   ___|_ _|____  / _| ___
       \___ \| | |   / _  |/ __|  _ \ / _ \| ||  _ \| |_ / _ \
        ___) | | |__| (_| | (__| | | |  __/| || | | |  _| (_) |
       |____/|_|\____\__,_|\___|_| |_|\___|___|_| |_|_|  \___/

===========================( SlCacheInfo )============================




                    1. Set Data Cache Location

                    2. Set Sound Cache Location

                    3. Start Monitoring Assets





----------------------------------------------------------------------
Select, Menu Options 1-3, Exit Program=X:

```
Monitoring..
```

===========================( SlCacheInfo )============================

Monitoring Assets...

Cache/Sound Dir:
S:\Cache - 3,949.90 MB
S:\Sound - 46.60 MB

Newest Texture Assets:
632d4c2e-bd94-22e2-cec6-878397039e0a.texture - 0.91 KB

Newest Object Assets:
objects_624_1151.slc - 3,169.54 KB

Newest Sound Assets:
ed124764-705d-d497-167a-182cd9fa2e6c.dsf - 51.78 KB

Newest Other Assets:
sl_cache_fe48f01d-5a0c-1a35-2cc0-fd1b2241aa97_0.asset - 458.25 KB

----------------------------------------------------------------------
Refresh In 15 Seconds, Press M To Return To Menu...

```

## USAGE
1. Download the release.
2. Extract to suitable folder.
3. Run your Second Life viewer, go to the settings and note where the cache files are stored, additionally you may wish to move the data cache, and if you have the option then set the sound cache to a separate dir too.
4. Run `SlCacheInfo.Bat`, use the menu options 1-2 to set the loctions of the, cache and sound, folders you just noted.
5. Select option 3 to begin monitoring, when you are done press "m" to return to menu (SlCacheInfo => v0.03), or simply close via the `[X]` in the top right of the console window.

### REQUIREMENTS
- .NET => 2.0
- PowerShell => 3.0.
- Second Life installation (Only tested on FireStorm).
- Batch compatibility (For Batch launcher execution).

### NOTATION
- For a guide to using RamDisks including a script for automatically, mounting and unmounting, a Ramdrive for Second Life, [heres what I have put together](https://github.com/wiseman-timelord/RamDiskTempHelp-Ba).

## DISCLAIMER
This software is subject to the terms in License.Txt, covering usage, distribution, and modifications. For full details on your rights and obligations, refer to License.Txt.
