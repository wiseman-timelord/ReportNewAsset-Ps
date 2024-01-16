# ReportNewAsset-Ps

### STATUS: ALPHA
Working on it, its going to be a quick one, done in half a day.
- fix monitor, broke since refractoring of code.
- break from monitoring loop to return to main menu.

## DESCRIPTION
ReportNewAsset is a tool to monitor for, new and updated, files in the cache of specifically "FireStorm" a "Second Life" viewer application, however, it may work with other veiewers, that utilize the same cache format, mainly the, file extensions and folder structure, in the cache. This is good for, "data visualization" and "cache analysis", though due to checking multiple things to do with file systems upon a repeating 15 second basis, its not advised to let it run upon an ongoing basis, unless that is extremely important to some task you have to do. ReportNewAsset is perfect for determining how large your SL cache should be, albeit overkill and a intellectual curiosity, but it is also somewhat good for getting some, metrics and real information, of, how much and what, data is being downloaded, instead of just the normal download data rate readout.   

### FEATURES
- **Customizable Cache Locations**: Set custom paths for different Second Life cache data types.
- **Dynamic File Monitoring**: Real-time directory monitoring for new file creations using FileSystemWatcher.
- **Automated File Tracking**: Updates and tracks the latest files in categories like Textures, Objects, Sounds, and Others.
- **Real-time Asset Reporting**: Displays updated information of the latest files, including names and sizes.

### PREVIEW
Main Menu..
```

                       -= Report New Asset =-





                    1. Set Data Cache Location

                    2. Set Sound Cache Location

                    3. Start Monitoring Assets






Select, Menu Options 1-3, Exit Program=X:

```
Monitoring..
```

                      -= Monitoring Assets =-

 Cache/Sound Dir:
R:\FireStorm\Data - 4,412.31 MB
R:\FireStorm\Sound - 36.62 MB

 Textures:
c13826bf-9ca4-6f18-f24f-c3161d92ba70.texture - 7.41 KB

 Objects:
objects_851_896.slc - 3,567.13 KB

 Sounds:
add38606-02d9-16db-c867-dff11df8aa72.dsf - 430.71 KB

 Other:
sl_cache_4e1511a9-36fb-495c-29dd-9b28bf6be69c_0.asset - 441.19 KB

 Refresh In 15 Seconds...

```

## USAGE
Soon...

### NOTATION
- consolidating

## DISCLAIMER
This software is subject to the terms in License.Txt, covering usage, distribution, and modifications. For full details on your rights and obligations, refer to License.Txt.
