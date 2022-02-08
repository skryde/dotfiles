#!/bin/bash

##
## Codigo obtenido de: https://www.reddit.com/r/unixporn/comments/3358vu/comment/cqicget/?utm_source=share&utm_medium=web2x&context=3
##
ICON=$HOME/Arch-Lock-Icon.png
TMPBG=$HOME/tmp/bg-screenshot.png

# Se saca un screenshot de la/s pantallas, sobrescribiendo el anterior si existiera.
scrot --overwrite $TMPBG

# Se pausa Spotify, si es que esta corriendo...
if pidof spotify > /dev/null; then
    dbus-send --session --dest=org.mpris.MediaPlayer2.spotify --type=method_call /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Stop
fi

# Se obtiene el size del icono para saber como agregarlo a la imagen de fondo.
# Luego se obtiene la resolucion de el o los monitores, y calcula para cada uno
# de ellos, en que posicion se debe pegar el icono.
# Con toda esa info se carga una variable que tiene la misma porcion de
# codigo para cada monitor detectado.
PX=0
PY=0
ICON_ADD_PARAMS=""

# Lockscreen image info
R=$(file $ICON | grep -o '[0-9]* x [0-9]*')
RX=$(echo $R | cut -d' ' -f 1)
RY=$(echo $R | cut -d' ' -f 3)

SR=$(xrandr --query | grep ' connected' | cut -f3 -d' ')
for RES in $SR; do
    # Monitor position/offset
    SRX=$(echo $RES | cut -d'x' -f 1)                   # x pos
    SRY=$(echo $RES | cut -d'x' -f 2 | cut -d'+' -f 1)  # y pos
    SROX=$(echo $RES | cut -d'x' -f 2 | cut -d'+' -f 2) # x offset
    SROY=$(echo $RES | cut -d'x' -f 2 | cut -d'+' -f 3) # y offset

    PX=$(($SROX + $SRX/2 - $RX/2))
    PY=$(($SROY + $SRY/2 - $RY/2))

    ICON_ADD_PARAMS="$ICON -geometry +$PX+$PY -composite -matte $ICON_ADD_PARAMS"
done

# Se pixela la imagen, y se agregan los iconos en la mitad de cada pantalla detectada (ponele).
convert $TMPBG -scale 10% -scale 1000% $ICON_ADD_PARAMS $TMPBG

# Se bloquea la pantalla estableciendo el screenshot pixelado como imagen de fondo.
i3lock -i $TMPBG

