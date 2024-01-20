# SlCacheInfo-Ps

### STATUS: WORKING
SlCacheInfo works correctly. Possible upgrades are...
- better breakdown of space usage for folders, "cache\cache", "cache\cef_cache", "cache\objectcache", "cache\texturecache".
- use of firestorm settings file, thus only requiring to set the location of the settings folder on one option on the menu, or better yet if possible then detection of location.

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
General = 3,482.32MB, Media = 14.43MB, Objects = 13.42MB, Textures = 929.80MB, Sounds = 121.09MB

Newest Texture Assets:
d53da781-56c5-4f78-b308-04c27c05ab2b.texture - 1.41 KB

Newest Object Assets:
objects_787_1039.slc - 393.01 KB

Newest Sound Assets:
bcb6dd68-1d01-5a32-9036-612c797373f9.dsf - 703.75 KB

Newest Other Assets:
sl_cache_beb1fec7-d735-be45-b632-77cc97c0f595_0.asset - 62.82 KB

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
- In conclusion, the correct configuration for ramdisks in SL would be a 15GB ramdisk, with, 10GB (max) for Cache and 4GB for Assets, leaving 1GB for clearence, and obviously logs do not go on the ramdisk. 
- For a guide to using RamDisks including a script for automatically, mounting and unmounting, a Ramdrive for Second Life, [heres what I have put together](https://github.com/wiseman-timelord/RamDiskTempHelp-Ba).

## DISCLAIMER
This software is subject to the terms in License.Txt, covering usage, distribution, and modifications. For full details on your rights and obligations, refer to License.Txt.
