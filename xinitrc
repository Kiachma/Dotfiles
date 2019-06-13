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

xrdb -load ~/.Xresources

#xrdb -merge ~/.Xresources

#Fix grey window in java programs
export _JAVA_AWT_WM_NONREPARENTING=1
#Fix fonts
#
mkfontscale /usr/share/fonts/local
mkfontdir /usr/share/fonts/local
xset +fp /usr/share/fonts/local
nitrogen --restore &
# xrandr --output  DVI-I-1 --pos 0x660   --output  DVI-D-0 --rotate left --pos 1920x0
#feh --bg-scale /home/eaura/Google\ Drive/wallpaper.jpg
gnome-settings-daemon
gnome-keyring-daemon
nvidia-settings --load-config-only
nm-applet --sm-disable &
python3 /home/eaura/.mozilla/native-messaging-hosts/passff.py
# exec i3 -V >> ~/i3log-$(date +'%F-%k-%M-%S') 2>&1

# exec gnome-session
