#!/bin/bash

echo '############ installing xf86-video-vmware and virtualbox-guest-utils '
pacman -Sq virtualbox-guest-utils
systemctl enable vboxservice
