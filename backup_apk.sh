#!/bin/sh

ABC=`adb shell pm list packages -3`

for i in $ABC
do	
 temp=`echo $i| awk -F ':' '{print $2}'`
 path=`adb shell pm path $temp|awk -F ':' '{print $2}'`
 apkName=`echo $path |awk -F '/' '{print $4}'`".apk" 
 `adb pull $path  $apkName`
 echo "apk $apkName Copied to the System"
done
