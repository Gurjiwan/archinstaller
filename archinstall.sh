#!/bin/bash
#Script for arch linux install for personal use

read -p "DO you want to use partition preset{Y/N} (default: Y): " usepartvar
usepartvar=${usepartvar:-Y}
if [[ ${usepartvar} == N ]];then
    printf "Please use fdisk to create required partitions .. \n"
    read -p "Enter the root partition or btrfs subvolume (e.g., /dev/sda1): " customvar1
    customvar1=${customvar1:-No}
    read -p "Enter swap partition (default = No): " customvar2
    customvar2=${customvar2:-No}
    read -p "Enter efi partition (For Legacy default = No): " customvar3
    customvar3=${customvar3:-No}
    read -p "Enter a home partition (default = No)" customvar4
    customvar4=${customvar4:-No}
    if [[ ${customvar1} == No ]];then
	printf "\033[0;31m Error enter a root partition for system to begin installation \n"
	exit 1
    else
	mount ${customvar1} /mnt
    fi

    printf "Note: Please make sure the partitions except swap are already formatted \n"
    if [[ ${customvar2} == No ]];then
	continue
    else
	mkswap ${customvar2}
	swapon ${customvar2}
    fi
    if [[ ${customvar3} == No ]];then continue else mount --mkdir ${customvar3} /mnt/efi fi
    if [[ ${customvar4} == No ]];then continue else mount --mkdir ${customvar4} /mnt/home fi
else
   ./partition.sh 
fi

