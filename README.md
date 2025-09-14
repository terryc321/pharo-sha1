# Sha1

exploring use of Sha1 hash using pharo , upto pharo 13 

# md5

some large files

 41978439 1254400 -r--r--r--   1 terry    terry    1284499606 Aug 29 17:48 /home/terry/bin/cuis-smalltalk/Cuis-Smalltalk-Dev/.git/objects/pack/pack-61fe230b540d7d815ff049a3895f03c1f6657c11.pack
 41767078 1498016 -rw-rw-r--   1 terry    terry    1533963181 Aug  4 08:43 /home/terry/bin/android/android-studio-2025.1.2.11-linux.tar.gz
 42217982 2264068 -rw-rw-r--   1 terry    terry    2318401536 Aug  4 08:54 /home/terry/Android/Sdk/system-images/android-36/google_apis_playstore/x86_64/system.img
 42469278 2096996 -rw-r--r--   1 terry    terry    2147483648 Aug  4 09:30 /home/terry/.android/avd/Medium_Phone.avd/snapshots/default_boot/ram.img
 42356916 2352200 -rw-r--r--   1 terry    terry    2408710144 Aug  4 09:30 /home/terry/.android/avd/Medium_Phone.avd/userdata-qemu.img.qcow2

md5sum /home/terry/bin/cuis-smalltalk/Cuis-Smalltalk-Dev/.git/objects/pack/pack-61fe230b540d7d815ff049a3895f03c1f6657c11.pack
echo 

md5sum /home/terry/bin/android/android-studio-2025.1.2.11-linux.tar.gz
echo

md5sum /home/terry/Android/Sdk/system-images/android-36/google_apis_playstore/x86_64/system.img
echo 

md5sum /home/terry/.android/avd/Medium_Phone.avd/snapshots/default_boot/ram.img
echo

md5sum /home/terry/.android/avd/Medium_Phone.avd/userdata-qemu.img.qcow2
echo

**********************************************************************************************************************************************************

c8dc00f395230ff7a0844e96db7c43e2  /home/terry/bin/cuis-smalltalk/Cuis-Smalltalk-Dev/.git/objects/pack/pack-61fe230b540d7d815ff049a3895f03c1f6657c11.pack
>
>>d330e882e3179d0d7926e7863d3576a4  /home/terry/bin/android/android-studio-2025.1.2.11-linux.tar.gz
>
>>e6f50fc996f47a96de85405325a20d2c  /home/terry/Android/Sdk/system-images/android-36/google_apis_playstore/x86_64/system.img
>
>>67ecea33f0bb5e5dbfd765b049fefc7c  /home/terry/.android/avd/Medium_Phone.avd/snapshots/default_boot/ram.img
>
>>f474529b8a34f4f8c81e562f2f3114d3  /home/terry/.android/avd/Medium_Phone.avd/userdata-qemu.img.qcow2
>
**********************************************************************************************************************************************************


"we can get a file reference how read bytes ?"
'/home/terry/bin/cuis-smalltalk/Cuis-Smalltalk-Dev/.git/objects/pack/pack-61fe230b540d7d815ff049a3895f03c1f6657c11.pack' asFileReference . 





