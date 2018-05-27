#!/bin/bash
status=$(cat /sys/class/drm/card0-DP-1/status);

export DISPLAY=":0";
export XAUTHORITY="/home/sfhp/.Xauthority";
export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus";

xrandr --auto;

if [ $status == "connected" ]
then
    xrandr --output eDP1 --off;
fi
