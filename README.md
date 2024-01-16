# SlCacheInfo-Ps

### STATUS: WORKING
SlCacheInfo works correctly, no issues.

## DESCRIPTION
SlCacheInfo is a tool to monitor for, new and updated, files in the cache of "Second Life" viewers, through specifically, developed for and tested on, "FireStorm", however, it may work with other veiewers, that utilize the same cache format, mainly the, file extensions and folder structure, in the cache. This is good for, "data visualization" and "cache analysis", though due to checking multiple things to do with file systems upon a repeating 15 second basis, its not advised to let it run upon an ongoing basis, unless that is extremely important to some task you have to do. SlCacheInfo is perfect for determining how large your SL cache should be, albeit overkill and a intellectual curiosity, but it is also somewhat good for getting some, metrics and real information, of, how much and what, data is being downloaded, instead of just the normal download data rate readout.   

### FEATURES
- **Customizable Cache Locations**: Set custom paths for different Second Life cache data types.
- **Dynamic File Monitoring**: Real-time directory monitoring for new file creations using FileSystemWatcher.
- **Automated File Tracking**: Updates and tracks the latest files in categories like Textures, Objects, Sounds, and Others.
- **Real-time Asset Reporting**: Displays updated information of the latest files, including names and sizes.

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
R:\FireStorm\Data - 4,730.31 MB
R:\FireStorm\Sound - 0.00 MB

Newest Texture Assets:
d18bed1f-bf01-0399-dc42-ae5e837010e2.texture - 0.91 KB

Newest Object Assets:
objects_851_896.slc - 3,578.44 KB

Newest Sound Assets:
No Relevantly Themed Files Exist!

Newest Other Assets:
sl_cache_ed11ad84-e720-f4ee-351e-0afda90d90bd_0.asset - 1.89 KB

----------------------------------------------------------------------
Refresh In 15 Seconds, Press M To Return To Menu...

```

## USAGE
1. Download the release (SlCacheInfo v0.02 For non .NET systems).
2. Extract to suitable folder.
3. Run your Second Life viewer, go to the settings and note where the cache files are stored, additionally you may wish to move the data cache, and if you have the option then set the sound cache to a separate dir too.
4. Run `SlCacheInfo.Bat`, use the menu options 1-2 to set the loctions of the, cache and sound, folders you just noted.
5. Select option 3 to begin monitoring, when you are done press "m" to return to menu (SlCacheInfo => v0.03), or simply close via the `[X]` in the top right of the console window.

### REQUIREMENTS
- .NET => 2.0 (SlCacheInfo => v1.03).
- PowerShell => 3.0.
- Second Life installation (Only tested on FireStorm).
- Batch compatibility (For Batch launcher execution).

## DISCLAIMER
This software is subject to the terms in License.Txt, covering usage, distribution, and modifications. For full details on your rights and obligations, refer to License.Txt.
