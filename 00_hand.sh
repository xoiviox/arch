loadkeys pl
timedatectl set-ntp true
fdisk /dev/sda
mkfs.ext4 /dev/sda1
mount /dev/sda1 /mnt
reflector -c pl
pacstrap /mnt base linux linux-firmware
genfstab -L /mnt >> /mnt/etc/fstab			### -L for label, -U for UUID
arch-chroot /mnt

pacman -S git
cd ~
git clone https://github.com/xoiviox/arch
