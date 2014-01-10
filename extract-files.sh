#!/bin/sh

BASE=../../../vendor/samsung/lt02wifiue/proprietary
rm -rf $BASE/*

for FILE in `egrep -v '(^#|^$)' proprietary-files.txt`; do
  DIR=`dirname $FILE`
  if [ ! -d $BASE/$DIR ]; then
    mkdir -p $BASE/$DIR
  fi
  # My way of pulling blobs without the device
  cp ~/android/dump/$FILE $BASE/$FILE
done

./setup-makefiles.sh
