#!/bin/bash

echo '############ installing xorg'
pacman -Sq xorg-server xorg-xinit

echo '############ installing xfce4 and apps'
pacman -Sq pavucontrol pulseaudio alsa-utils lightdm lightdm-gtk-greeter xfce4 mousepad thunar-archive-plugin thunar-media-tags-plugin xfce4-artwork xfce4-battery-plugin xfce4-datetime-plugin xfce4-dict xfce4-diskperf-plugin xfce4-fsguard-plugin xfce4-genmon-plugin xfce4-mpc-plugin xfce4-notifyd xfce4-pulseaudio-plugin xfce4-screensaver xfce4-sensors-plugin xfce4-time-out-plugin xfce4-timer-plugin xfce4-wavelan-plugin xfce4-weather-plugin xfce4-whiskermenu-plugin xfce4-xkb-plugin

systemctl enable lightdm

pacman -Sq nm-connection-editor network-manager-applet networkmanager-openvpn
pacman -Sq gnome-system-monitor 

