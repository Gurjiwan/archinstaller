#!/bin/bash

read -p "Please select the device to partition (e.g. /dev/sda): " customvar
read -p "Select a swap size in MiB (default: 0): " swapsizevar
swapsizevar=${swapsizevar:-0}

sgdisk -Z ${customvar} # ZAP the hardrive to remove any cerated partition

fdisk ${customvar} <<FDISK_Input
g
n
1

+512M

t
1

w
FDISK_Input

if [[ swapsizevar != 0 ]];then
    fdisk ${customvar} <<FDISK_swap
    n
    2

    +${swapsizevar}M

    t
    2
    19

    w
FDISK_swap
fi

fdisk ${customvar} <<FDISK_root
n




w
FDISK_root

print "Partition script end .. \n"
