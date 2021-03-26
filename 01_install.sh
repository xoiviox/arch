ln -sf /usr/share/zoneinfo/Europe/Warsaw /etc/localtime
hwclock --systohc
sed -i 's/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/g' /etc/locale.gen
sed -i 's/#pl_PL.UTF-8 UTF-8/pl_PL.UTF-8 UTF-8/g' /etc/locale.gen
locale-gen
echo 'LANG=pl_PL.UTF-8' >> /etc/locale.conf
echo 'KEYMAP=pl' >> /etc/vconsole.conf
