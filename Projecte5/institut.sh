#!/bin/bash

url="https://agora.xtec.cat/ies-sabadell/"

while true; do
    if ping -c 1 "$url" &>/dev/null; then
        echo "Conexion a Internet establecida!"
        firefox "$url" &
        break
    else
        echo "No hay conexion a Internet. Esperando 5 segundos..."
        sleep 5
    fi
done
