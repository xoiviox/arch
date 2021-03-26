#!/bin/bash

echo '############ setting localtime'
ln -sf '/usr/share/zoneinfo/Europe/Warsaw' '/etc/localtime'
hwclock --systohc

echo '############ setting locale'
sed -i 's/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/g' '/etc/locale.gen'
sed -i 's/#pl_PL.UTF-8 UTF-8/pl_PL.UTF-8 UTF-8/g' '/etc/locale.gen'
locale-gen
echo 'LANG=pl_PL.UTF-8' >> '/etc/locale.conf'
echo 'KEYMAP=pl' >> '/etc/vconsole.conf'

echo '############ setting hostname'
read -p '### enter hostname: ' HOSTNAME
echo $HOSTNAME >> '/etc/hostname'
echo -e '127.0.0.1	localhost' >> '/etc/hosts'
echo -e '::1		localhost' >> '/etc/hosts'
echo -e '127.0.1.1	'$HOSTNAME'.localdomain	'$HOSTNAME >> '/etc/hosts'

echo '############ add user'
read -p '### enter user name: ' USERNAME
useradd -m $USERNAME
usermod -aG wheel,audio,video,optical,storage $USERNAME
read -sp '### enter user password: ' USERPASSWORD
echo ''
echo -e '$USERPASSWORD\n$USERPASSWORD' | passwd $USERNAME

echo '############ create root password'
read -sp '### enter root password: ' ROOTPASSWORD
echo ''
echo -e '$ROOTPASSWORD\n$ROOTPASSWORD' | passwd root

echo '############ installing needed software'
reflector -c pl
pacman -S wget nano grub openssh sudo

echo '############ setting up grub'
echo -e '\nGRUB_FORCE_HIDDEN_MENU="true"' | tee -a '/etc/default/grub'
wget 'https://gist.githubusercontent.com/anonymous/8eb2019db2e278ba99be/raw/257f15100fd46aeeb8e33a7629b209d0a14b9975/gistfile1.sh' -O '/etc/grub.d/31_hold_shift'
chmod a+x '/etc/grub.d/31_hold_shift'
grub-mkconfig -o '/boot/grub/grub.cfg'
grub-install '/dev/sda'

echo '############ setting up sshd'
sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/g' '/etc/ssh/sshd_config'

echo '############ setting up visudo'
EDITOR='sed -i "s/# %wheel ALL=(ALL) ALL/%wheel ALL=(ALL) ALL/g"' visudo
