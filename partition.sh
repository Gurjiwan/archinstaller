#!/bin/bash

read -p "Please select the device to partition (e.g. /dev/sda): " customvar
read -p "Select a swap size in MiB (default: 0): " swapsizevar
swapsizevar=${swapsizevar:-0}

sgdisk -Z ${customvar} # ZAP the hardrive to remove any cerated partition

rootvar=${customvar}3

fdisk ${customvar} <<FDISK_Input
g
n
1

+512M
Y
t
1
w
FDISK_Input

mkfs.fat -F 32 ${customvar}1

if [[ ${swapsizevar} != 0 ]];then
    fdisk ${customvar} <<FDISK_swap
    n
    2

    +${swapsizevar}M
    Y
    t
    2
    19
    w
FDISK_swap
    
    mkswap ${customvar}2
else
    rootvar=${customvar}2
fi

fdisk ${customvar} <<FDISK_root
n



Y
w
FDISK_root

command cryptsetup luksFormat ${root}
cryptsetup open ${rootvar} linuxfs

mkfs.btrfs /dev/mapper/linuxfs
mount /dev/mapper/linuxfs /mnt
btrfs subvolume create /mnt/@root
btrfs subvolume create /mnt/@home
umount /mnt

printf "Partition script end .. \n"
