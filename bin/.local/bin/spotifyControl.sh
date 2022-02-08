#!/bin/bash

if ! pidof spotify > /dev/null; then
    /usr/bin/spotify &
    sleep 2
fi

dbus-send --session --dest=org.mpris.MediaPlayer2.spotify --type=method_call /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause

