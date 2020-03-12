#!/bin/bash

sudo mv /etc/pacman.d/mirrorlist{,.bak}
if [ $? -eq 0 ]; then
	echo -e "   \e[32m\xE2\x9C\x94\e[39m  Mirrorlist actual respaldado"
else
	echo "No se pudo respaldar mirrorlist actual"
	exit 1
fi

sudo reflector --verbose --latest 100 --sort rate --save /etc/pacman.d/mirrorlist
if [ $? -eq 0 ]; then
	echo -e "   \e[32m\xE2\x9C\x94\e[39m  Mirrorlist actualizado"
else
	echo "No se pudo actualizar mirrorlist"
fi

