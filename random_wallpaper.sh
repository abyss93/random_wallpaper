#!/bin/bash

# check arguments
if [ -z "$1" ]
then
	echo "Missing wallpapers directory argument"
	exit 1
fi

# where wallpapers are
echo "=> Directory: $1"
cd $1

# export DBUS_SESSION_BUS_ADDRESS environment variable
PID=$(pgrep -t tty2 gnome-session)
export DBUS_SESSION_BUS_ADDRESS=$(grep -z DBUS_SESSION_BUS_ADDRESS /proc/$PID/environ|cut -d= -f2-)

# random wallpaper
files=(*)
echo "= Found wallpapers ="
printf '%s\n' "${files[@]}"
echo
WALLPAPERS_NO=${#files[@]}
echo "=> number of wallpapers: $WALLPAPERS_NO"
RANDOM_WALLPAPER_INDEX=$(($RANDOM % WALLPAPERS_NO))
echo "=> randomly selected wallpaper index: $RANDOM_WALLPAPER_INDEX"
SELECTED_WALLPAPER=${files[RANDOM_WALLPAPER_INDEX]}
echo "=> setting wallpaper [$SELECTED_WALLPAPER]"

# apply
gsettings set org.gnome.desktop.background picture-uri file:////home/lorenzo/Immagini/Sfondi/$SELECTED_WALLPAPER
