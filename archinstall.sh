#!/bin/bash
#Script for arch linux install for personal use

printf "Please use fdisk to create required partitions .. \n"
read -p "Enter the root partition (e.g., /dev/sda1): " customvar1
customvar1=${customvar1:-No}
read -p "Enter swap partition (default = No): " customvar2
customvar2=${customvar2:-No}
read -p "Enter efi partition (For Legacy default = No): " customvar3
customvar3=${customvar3:-No}
read -p "Enter a home partition (default = No)" customvar4
customvar4=${customvar4:-No}

if [[ ${customvar1} == No ]];then
    printf '\033[0;31m Error enter a root partition for system to begin installation\n'
    exit 1
fi
