#!/bin/bash

script_dir=$(dirname "$(pwd)/$0")

# shellcheck disable=SC2164
pushd "$script_dir" > /dev/null

rm -rf temp
mkdir -p temp
cd temp

wget https://downloads.raspberrypi.org/raspbian_full_latest
unzip raspbian_full_latest

raspbian_image=$(ls | grep img)

echo $raspbian_image

diskutil list

echo "Identify the disk (not the partition) of your SD card, e.g. disk4, not  disk4s1"

read sdcard

diskutil unmountDisk /dev/$sdcard

sudo dd bs=1m if=$raspbian_image of=/dev/r$sdcard conv=sync

diskutil eject /dev/r$sdcard

popd > /dev/null