#!/bin/bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

#autorandr horizontal
run nm-applet
#run caffeine
run pamac-tray
run variety
run xfce4-power-manager
run blueberry-tray
run /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1
run numlockx on
# run volumeicon
run pasystray
run lxpolkit
run nitrogen --restore
run conky -c $HOME/.config/awesome/system-overview
run blueman-applet
#you can set wallpapers in themes as well
