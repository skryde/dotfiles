#!/bin/bash

# https://misc.flogisoft.com/bash/tip_colors_and_formatting
# https://unix.stackexchange.com/questions/343934/print-check-cross-mark-in-shell-script
#
echo ""

# Se habilita SQL Server
#sudo systemctl start mssql-server.service
#if [ $? -eq 0 ]; then
#	echo -e "   \e[32m\xE2\x9C\x94\e[39m  SQLServer iniciado correctamente"
#fi

# Se habilita Docker
sudo systemctl start docker.service
if [ $? -eq 0 ]; then
	echo -e "   \e[32m\xE2\x9C\x94\e[39m  Servicio de Docker iniciado correctamente"
fi

# Se levanta el servicio de RethinkDB
#sudo docker run -d -p 8081:8080 -p 28015:28015 -p 29015:29015 rethinkdb > /dev/null
#if [ $? -eq 0 ]; then
#	echo -e "   \e[32m\xE2\x9C\x94\e[39m  RethinkDB iniciado correctamente"
#fi

echo ""

