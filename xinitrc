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

# -- slow down mouse
xset m 1/5


# -- load awesome window manager
#exec awesome

#Fix fonts
xset +fp /usr/share/fonts/local
xset fp rehash

#Fix grey window in java programs
export _JAVA_AWT_WM_NONREPARENTING=1
exec   herbstluftwm --locked
sleep 25 && dropboxd

