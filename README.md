# SlCacheInfo-Ps

### STATUS: WORKING
SlCacheInfo works correctly.

## DESCRIPTION
SlCacheInfo is a tool to monitor for, new and updated, files in the cache of "Second Life" viewers, through specifically, developed for and tested on, "FireStorm", however, it may work with other viewers, that utilize the same cache format, mainly the, file extensions and folder structure, in the cache. This is good for, "data visualization" and "cache analysis", though due to checking multiple things to do with file systems upon a repeating 15 second basis. SlCacheInfo is perfect for determining how large your, SL cache/sound allocations and ramdisk, should be, its also somewhat effective as a data visualization tool. Upon the desire to use other viewers, then I shal program it to be compatible with those too, and if that is the case, then I will mention it. 

### FEATURES
- **Customizable Cache Locations**: Set custom paths for Second Life, Cache AND Sound, folders, which  also means, in the viewer set them to 2 differing locations.
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
General = 3,486.12MB, Media = 14.74MB, Objects = 15.75MB, Textures = 9
39.70MB, Sounds = 122.74MB

Newest Texture Assets:
a3035c53-34d8-9b34-e1af-dedc9ecd33a2.texture = 30.66KB

Newest Object Assets:
objects_943_945.slc = 2,387.80KB

Newest Sound Assets:
7982668c-5913-fa38-929c-0eeafdd79a1d.dsf = 839.54KB

Newest Other Assets:
sl_cache_9790c21b-ced4-5b28-930c-ac8ff83e6c61_0.asset = 140.41KB

----------------------------------------------------------------------
Refresh In 15 Seconds, Press M To Return To Menu...
```

## USAGE
1. Download the release.
2. Extract to suitable folder.
3. Run your Second Life viewer, go to the settings and note where the cache files are stored, additionally you may wish to move the data cache, and if you have the option then set the sound cache to a separate dir too. If the viewer does not have a separate sound cache folder, then just leave the sound one, and unfortunately those stats will not be available.
4. Run `SlCacheInfo.Bat`, use the menu options 1-2 to set the loctions of the, cache and sound, folders you just noted.
5. Select option 3 to begin monitoring, when you are done press "m" to return to menu (SlCacheInfo => v0.03), or simply close via the `[X]` in the top right of the console window.

### REQUIREMENTS
- .NET => 2.0
- PowerShell => 3.0.
- Second Life installation (Only tested on FireStorm).
- Batch compatibility (For Batch launcher execution).

### NOTATION
- In conclusion, there are 2 settings for cache in FireStorm, Textures and Assets. When I had 4576MB of cache, 939MB of that was Textures, so one would assume the remainder of 3637MB was "Assets", hence, (939/3637)*9984=2577 (9986 is max), means the optimal settings for, texture cache is 2577MB and asset cache is 9984MB, and so the correct size for the ramdisk would be relatingly 12.75-13GB, so as to give some clearence.
- For a guide to using RamDisks including a script for automatically, mounting and unmounting, a Ramdrive for Second Life, [heres what I have put together](https://github.com/wiseman-timelord/RamDiskTempHelp-Ba).

### DEVELOPMENT
Possible upgrades are...
- Select Firestorm folder to get locations of folders from settings file. However, this would make it completely incompatible with other viewers.
- Detect viewers installed and present menu with options, use of registry to get install folder, from install folder locate settings file, from settings file gain locations of cache folders.
- Dynamic display with only labels showing relating to specific viewer being used.

## DISCLAIMER
This software is subject to the terms in License.Txt, covering usage, distribution, and modifications. For full details on your rights and obligations, refer to License.Txt.
