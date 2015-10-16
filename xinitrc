#!/bin/sh
if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi
# -- start pulse audio
#/usr/bin/start-pulseaudio-x11 &


xmodmap ~/.Xmodmap
xbindkeys &
xcompmgr &

# -- slow down mouse
xset m 1/5



xrdb -merge ~/.Xresources

#Fix grey window in java programs
export _JAVA_AWT_WM_NONREPARENTING=1
#Fix fonts
#
mkfontscale /usr/share/fonts/local
mkfontdir /usr/share/fonts/local
xset +fp /usr/share/fonts/local
exec   i3 

