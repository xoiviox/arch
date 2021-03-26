#!/bin/bash

echo '############ installing xf86-video-vmware and virtualbox-guest-utils '
pacman --noconfirm -Sq virtualbox-guest-utils
systemctl enable vboxservice
