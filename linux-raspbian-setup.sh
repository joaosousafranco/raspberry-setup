#!/bin/bash

script_dir=$(dirname "$(pwd)/$0")

custom_image=$1

# shellcheck disable=SC2164
pushd "$script_dir" > /dev/null

rm -rf temp
mkdir -p temp
cd temp

if [ $custom_image ]; then
  raspbian_image=$custom_image
else
  wget https://downloads.raspberrypi.org/raspbian_full_latest
  unzip raspbian_full_latest

  raspbian_image=$(ls | grep img) 
fi

echo $raspbian_image

lsblk -p

echo "Identify the disk (not the partition) of your SD card, e.g. disk4, not  disk4s1"

read sdcard

umount /dev/$sdcard

sudo dd bs=1M if=$raspbian_image of=/dev/r$sdcard conv=fsync

popd > /dev/null